#!/usr/bin/env python3
"""Add 17 more pipe synthetic examples to reach 20 total."""
import json
from pathlib import Path

SYNTHETIC_DIR = Path("/home/jericho/projects/zion/projects/geometry_os/geometry_os/traces/synthetic")
pipe_file = SYNTHETIC_DIR / "synthetic_pipe.json"

data = json.loads(pipe_file.read_text())
examples = data["syscalls"]

# We have 3 real examples, add 17 synthetic
for i in range(17):
    synthetic = {
        "syscall": {
            "number": 59,
            "name": "pipe",
            "description": "Create pipe"
        },
        "arguments": {
            "a0": 2147479368 + (i * 100),  # Vary pipefd address
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
    }
    examples.append(synthetic)

output = {
    "trace_name": "synthetic_pipe",
    "syscalls": examples
}

pipe_file.write_text(json.dumps(output, indent=2))
print(f"✓ Wrote {len(examples)} pipe examples to {pipe_file.name}")