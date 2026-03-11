#!/usr/bin/env python3
import subprocess
import sys

result = subprocess.run(
    ["python3", "-m", "pytest", "tests/test_gravity_engine_quadtree.py", "-v"],
    cwd="/home/jericho/zion/projects/geometry_os/geometry_os",
    capture_output=True,
    text=True
)
print(result.stdout)
print(result.stderr)
sys.exit(result.returncode)
