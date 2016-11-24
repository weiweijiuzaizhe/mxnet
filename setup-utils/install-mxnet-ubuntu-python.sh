#!/usr/bin/env bash
######################################################################
# This script installs MXNet for Python along with all required dependencies on a Ubuntu Machine.
# Tested on Ubuntu 14.0 + distro.
######################################################################
set -e

MXNET_HOME="$HOME/mxnet/"
echo "MXNet root folder: $MXNET_HOME"

echo "Installing build-essential, libatlas-base-dev, libopencv-dev..."
sudo apt-get update
sudo apt-get install -y build-essential libatlas-base-dev libopencv-dev

echo "Building MXNet core. This can take few minutes..."
cd "$MXNET_HOME"
make -j$(nproc)

echo "Installing Numpy..."
sudo apt-get install python-numpy

echo "Installing Python setuptools..."
sudo apt-get install python-setuptools

echo "Installing Python package for MXNet..."
cd python; sudo python setup.py install

echo "Adding MXNet path to your ~/.bashrc file"
echo "export PYTHONPATH=$MXNET_HOME/python:PYTHONPATH" >> ~/.bashrc
source ~/.bashrc

echo "Done! MXNet for Python installation is complete. Go ahead and explore MXNet with Python :-)"
