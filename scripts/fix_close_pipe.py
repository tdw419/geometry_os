#!/usr/bin/env python3
"""Fix close and pipe synthetic traces with correct argument patterns."""
import json
from pathlib import Path

SYNTHETIC_DIR = Path("/home/jericho/projects/zion/projects/geometry_os/geometry_os/traces/synthetic")

# Fix close - a0 is the fd, other args are random
close_data = {
    "trace_name": "synthetic_close",
    "syscalls": []
}

for fd in [3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22]:
    close_data["syscalls"].append({
        "syscall": {
            "number": 57,
            "name": "close",
            "description": "Close file descriptor"
        },
        "arguments": {
            "a0": fd,
            "a1": 8200,
            "a2": 4585,
            "a3": 2147479368,
            "a4": 4308,
            "a5": 196
        },
        "return_value": 0,
        "semantics": {
            "spatial_ops": ["free_fd_table_pixels"]
        }
    })

(SYNTHETIC_DIR / "synthetic_close.json").write_text(json.dumps(close_data, indent=2))
print("✓ Fixed synthetic_close.json")

# Fix pipe - a0 is the pipefd pointer
pipe_data = {
    "trace_name": "synthetic_pipe",
    "syscalls": []
}

for i in range(20):
    pipefd_addr = 2147479000 + (i * 100)
    pipe_data["syscalls"].append({
        "syscall": {
            "number": 59,
            "name": "pipe",
            "description": "Create pipe"
        },
        "arguments": {
            "a0": pipefd_addr,
            "a1": 4308,
            "a2": 4576,
            "a3": 0,
            "a4": 0,
            "a5": 0
        },
        "return_value": 0,
        "semantics": {
            "spatial_ops": ["allocate_pipe_buffer_pixels"]
        }
    })

(SYNTHETIC_DIR / "synthetic_pipe.json").write_text(json.dumps(pipe_data, indent=2))
print("✓ Fixed synthetic_pipe.json")

print("\nDone!")