#!/usr/bin/env python3
"""Fix pipe syscall - use number 8 and small a0 values."""
import json
from pathlib import Path

SYNTHETIC_DIR = Path("/home/jericho/projects/zion/projects/geometry_os/geometry_os/traces/synthetic")

pipe_data = {
    "trace_name": "synthetic_pipe",
    "syscalls": []
}

# From real traces: syscall number is 8, a0 is 3 or 4 (pipefd)
for i in range(10):
    pipe_data["syscalls"].append({
        "syscall": {
            "number": 8,
            "name": "pipe",
            "description": "Create pipe"
        },
        "arguments": {
            "a0": 3,
            "a1": 2147478848,
            "a2": 4602,
            "a3": 2147479336,
            "a4": 4308,
            "a5": 1
        },
        "return_value": 0,
        "semantics": {
            "spatial_ops": ["allocate_pipe_buffer_pixels"]
        }
    })

for i in range(10):
    pipe_data["syscalls"].append({
        "syscall": {
            "number": 8,
            "name": "pipe",
            "description": "Create pipe"
        },
        "arguments": {
            "a0": 4,
            "a1": 2147478848,
            "a2": 14,
            "a3": 2147479336,
            "a4": 46,
            "a5": 2147478888
        },
        "return_value": 0,
        "semantics": {
            "spatial_ops": ["allocate_pipe_buffer_pixels"]
        }
    })

(SYNTHETIC_DIR / "synthetic_pipe.json").write_text(json.dumps(pipe_data, indent=2))
print("✓ Fixed synthetic_pipe.json with syscall number 8")