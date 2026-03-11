#!/bin/bash
cd /home/jericho/zion/projects/geometry_os/geometry_os
python3 -m pytest tests/test_gravity_engine_quadtree.py -v 2>&1
