#!/usr/bin/env python3
"""Generate 20 openat traces with proper spatial ops - robust version."""
import json, requests
from pathlib import Path

PROJECT_ROOT = Path("/home/jericho/projects/zion/projects/geometry_os/geometry_os")
SYNTHETIC_DIR = PROJECT_ROOT / "traces" / "synthetic"

# Generate diverse openat examples manually to ensure correctness
examples = [
    {"dirfd": -100, "path_ptr": 1000, "flags": 0, "mode": 438, "return_value": 3},    # AT_FDCWD, O_RDONLY, success
    {"dirfd": -100, "path_ptr": 2000, "flags": 1, "mode": 420, "return_value": 4},    # AT_FDCWD, O_WRONLY, success
    {"dirfd": -100, "path_ptr": 3000, "flags": 2, "mode": 0, "return_value": 5},      # AT_FDCWD, O_RDWR, success
    {"dirfd": 3, "path_ptr": 4000, "flags": 0, "mode": 438, "return_value": 6},       # dirfd=3, O_RDONLY, success
    {"dirfd": 5, "path_ptr": 5000, "flags": 64, "mode": 438, "return_value": 7},      # O_CREAT, success
    {"dirfd": 7, "path_ptr": 6000, "flags": 512, "mode": 420, "return_value": 8},     # O_TRUNC, success
    {"dirfd": -100, "path_ptr": 7000, "flags": 0, "mode": 0, "return_value": -1},     # File not found, error
    {"dirfd": 9, "path_ptr": 8000, "flags": 1, "mode": 438, "return_value": -1},      # Permission denied, error
    {"dirfd": 11, "path_ptr": 9000, "flags": 2, "mode": 420, "return_value": 10},     # dirfd=11, O_RDWR, success
    {"dirfd": -100, "path_ptr": 10000, "flags": 64|512, "mode": 438, "return_value": 11},  # O_CREAT|O_TRUNC, success
    {"dirfd": 3, "path_ptr": 11000, "flags": 0, "mode": 438, "return_value": 12},    # Nested path, success
    {"dirfd": 5, "path_ptr": 12000, "flags": 2, "mode": 0, "return_value": 13},      # dirfd=5, O_RDWR, success
    {"dirfd": -100, "path_ptr": 13000, "flags": 1, "mode": 420, "return_value": -1}, # Write to non-existent dir, error
    {"dirfd": 7, "path_ptr": 14000, "flags": 64, "mode": 438, "return_value": 14},   # dirfd=7, O_CREAT, success
    {"dirfd": 9, "path_ptr": 15000, "flags": 512, "mode": 420, "return_value": 15},  # dirfd=9, O_TRUNC, success
    {"dirfd": 11, "path_ptr": 16000, "flags": 0, "mode": 0, "return_value": -1},     # Invalid path, error
    {"dirfd": -100, "path_ptr": 17000, "flags": 2, "mode": 438, "return_value": 16}, # AT_FDCWD, O_RDWR, success
    {"dirfd": 3, "path_ptr": 18000, "flags": 64, "mode": 438, "return_value": 17},   # dirfd=3, O_CREAT, success
    {"dirfd": 5, "path_ptr": 19000, "flags": 512, "mode": 420, "return_value": 18},  # dirfd=5, O_TRUNC, success
    {"dirfd": 7, "path_ptr": 20000, "flags": 1, "mode": 0, "return_value": -1},      # Permission error
]

# Build the JSON structure
data = {
    "trace_name": "synthetic_openat",
    "syscalls": []
}

for ex in examples:
    syscall_data = {
        "syscall": {"name": "openat", "number": 56},
        "arguments": {
            "a0": ex["dirfd"],
            "a1": ex["path_ptr"],
            "a2": ex["flags"],
            "a3": ex["mode"],
            "a4": 0,
            "a5": 0
        },
        "return_value": ex["return_value"],
        "semantics": {
            "spatial_ops": ["traverse_directory_hilbert_tree", "load_inode_pixels"]
        }
    }
    data["syscalls"].append(syscall_data)

# Write to file
output_file = SYNTHETIC_DIR / "synthetic_openat.json"
output_file.write_text(json.dumps(data, indent=2))

print(f"✓ Generated {len(examples)} openat examples")
print(f"  File: {output_file}")

# Verify
test_load = json.loads(output_file.read_text())
print(f"  Verification: {len(test_load['syscalls'])} syscalls loaded successfully")