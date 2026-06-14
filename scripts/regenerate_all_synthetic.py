#!/usr/bin/env python3
"""
Generate ALL synthetic traces manually based on ground truth from real traces.
This ensures correctness and avoids LLM timeouts/parsing errors.
"""
import json
from pathlib import Path

PROJECT_ROOT = Path("/home/jericho/projects/zion/projects/geometry_os/geometry_os")
SYNTHETIC_DIR = PROJECT_ROOT / "traces" / "synthetic"

# Data structure: syscall_name -> list of examples
# Each example is a dict with 'count' (number of times to repeat) and 'generators'
SYNTHETIC_DATA = {
    "openat": {
        "count": 20,
        "data": [
            {"dirfd": -100, "path_ptr": 1000, "flags": 0, "mode": 438, "return_value": 3},
            {"dirfd": -100, "path_ptr": 2000, "flags": 1, "mode": 420, "return_value": 4},
            {"dirfd": -100, "path_ptr": 3000, "flags": 2, "mode": 0, "return_value": 5},
            {"dirfd": 3, "path_ptr": 4000, "flags": 0, "mode": 438, "return_value": 6},
            {"dirfd": 5, "path_ptr": 5000, "flags": 64, "mode": 438, "return_value": 7},
            {"dirfd": 7, "path_ptr": 6000, "flags": 512, "mode": 420, "return_value": 8},
            {"dirfd": -100, "path_ptr": 7000, "flags": 0, "mode": 0, "return_value": -1},
            {"dirfd": 9, "path_ptr": 8000, "flags": 1, "mode": 438, "return_value": -1},
            {"dirfd": 11, "path_ptr": 9000, "flags": 2, "mode": 420, "return_value": 10},
            {"dirfd": -100, "path_ptr": 10000, "flags": 576, "mode": 438, "return_value": 11},
            {"dirfd": 3, "path_ptr": 11000, "flags": 0, "mode": 438, "return_value": 12},
            {"dirfd": 5, "path_ptr": 12000, "flags": 2, "mode": 0, "return_value": 13},
            {"dirfd": -100, "path_ptr": 13000, "flags": 1, "mode": 420, "return_value": -1},
            {"dirfd": 7, "path_ptr": 14000, "flags": 64, "mode": 438, "return_value": 14},
            {"dirfd": 9, "path_ptr": 15000, "flags": 512, "mode": 420, "return_value": 15},
            {"dirfd": 11, "path_ptr": 16000, "flags": 0, "mode": 0, "return_value": -1},
            {"dirfd": -100, "path_ptr": 17000, "flags": 2, "mode": 438, "return_value": 16},
            {"dirfd": 3, "path_ptr": 18000, "flags": 64, "mode": 438, "return_value": 17},
            {"dirfd": 5, "path_ptr": 19000, "flags": 512, "mode": 420, "return_value": 18},
            {"dirfd": 7, "path_ptr": 20000, "flags": 1, "mode": 0, "return_value": -1},
        ],
        "ops": ["traverse_directory_hilbert_tree", "load_inode_pixels"]
    },

    "pipe": {
        "count": 20,
        "data": [
            {"return_value": 0}, {"return_value": 0}, {"return_value": 0}, {"return_value": 0}, {"return_value": 0},
            {"return_value": 0}, {"return_value": 0}, {"return_value": 0}, {"return_value": 0}, {"return_value": 0},
            {"return_value": 0}, {"return_value": 0}, {"return_value": 0}, {"return_value": 0}, {"return_value": 0},
            {"return_value": 0}, {"return_value": 0}, {"return_value": 0}, {"return_value": 0}, {"return_value": 0},
        ],
        "ops": ["allocate_pipe_buffer_pixels"]
    },

    "close": {
        "count": 20,
        "data": [
            {"fd": 3, "return_value": 0}, {"fd": 4, "return_value": 0}, {"fd": 5, "return_value": 0},
            {"fd": 6, "return_value": 0}, {"fd": 7, "return_value": 0}, {"fd": 8, "return_value": 0},
            {"fd": 9, "return_value": 0}, {"fd": 10, "return_value": 0}, {"fd": 11, "return_value": 0},
            {"fd": 12, "return_value": 0}, {"fd": 13, "return_value": 0}, {"fd": 14, "return_value": 0},
            {"fd": 15, "return_value": 0}, {"fd": 16, "return_value": 0}, {"fd": 17, "return_value": 0},
            {"fd": 18, "return_value": 0}, {"fd": 19, "return_value": 0}, {"fd": 20, "return_value": 0},
            {"fd": 21, "return_value": 0}, {"fd": 22, "return_value": 0},
        ],
        "ops": ["free_fd_table_pixels"]
    },

    "exit": {
        "count": 20,
        "data": [
            {"a0": 0, "return_value": 0}, {"a0": 1, "return_value": 0}, {"a0": 2, "return_value": 0},
            {"a0": 0, "return_value": 0}, {"a0": 1, "return_value": 0}, {"a0": 255, "return_value": 0},
            {"a0": 0, "return_value": 0}, {"a0": 1, "return_value": 0}, {"a0": 2, "return_value": 0},
            {"a0": 127, "return_value": 0}, {"a0": 0, "return_value": 0}, {"a0": 1, "return_value": 0},
            {"a0": 2, "return_value": 0}, {"a0": 0, "return_value": 0}, {"a0": 1, "return_value": 0},
            {"a0": 0, "return_value": 0}, {"a0": 1, "return_value": 0}, {"a0": 2, "return_value": 0},
            {"a0": 0, "return_value": 0}, {"a0": 1, "return_value": 0},
        ],
        "ops": ["free_user_memory"]
    },

    "wait": {
        "count": 20,
        "data": [
            {"a0": 1000, "a1": 0, "return_value": 1234}, {"a0": 2000, "a1": 0, "return_value": 1235},
            {"a0": 3000, "a1": 0, "return_value": 1236}, {"a0": 4000, "a1": 0, "return_value": 1237},
            {"a0": 5000, "a1": 0, "return_value": 1238}, {"a0": 6000, "a1": 0, "return_value": 1239},
            {"a0": 7000, "a1": 0, "return_value": 1240}, {"a0": 8000, "a1": 0, "return_value": 1241},
            {"a0": 9000, "a1": 0, "return_value": 1242}, {"a0": 10000, "a1": 0, "return_value": 1243},
            {"a0": 11000, "a1": 0, "return_value": 1244}, {"a0": 12000, "a1": 0, "return_value": 1245},
            {"a0": 13000, "a1": 0, "return_value": 1246}, {"a0": 14000, "a1": 0, "return_value": 1247},
            {"a0": 15000, "a1": 0, "return_value": 1248}, {"a0": 16000, "a1": 0, "return_value": 1249},
            {"a0": 17000, "a1": 0, "return_value": 1250}, {"a0": 18000, "a1": 0, "return_value": 1251},
            {"a0": 19000, "a1": 0, "return_value": 1252}, {"a0": 20000, "a1": 0, "return_value": 1253},
        ],
        "ops": ["scan_process_table_pixels"]
    },

    "unlink": {
        "count": 20,
        "data": [
            {"a0": -100, "a1": 1000, "return_value": 0}, {"a0": -100, "a1": 2000, "return_value": 0},
            {"a0": -100, "a1": 3000, "return_value": 0}, {"a0": -100, "a1": 4000, "return_value": 0},
            {"a0": -100, "a1": 5000, "return_value": 0}, {"a0": -100, "a1": 6000, "return_value": 0},
            {"a0": -100, "a1": 7000, "return_value": -1}, {"a0": -100, "a1": 8000, "return_value": -1},
            {"a0": -100, "a1": 9000, "return_value": 0}, {"a0": -100, "a1": 10000, "return_value": 0},
            {"a0": -100, "a1": 11000, "return_value": 0}, {"a0": -100, "a1": 12000, "return_value": 0},
            {"a0": -100, "a1": 13000, "return_value": 0}, {"a0": -100, "a1": 14000, "return_value": 0},
            {"a0": -100, "a1": 15000, "return_value": 0}, {"a0": -100, "a1": 16000, "return_value": 0},
            {"a0": -100, "a1": 17000, "return_value": 0}, {"a0": -100, "a1": 18000, "return_value": 0},
            {"a0": -100, "a1": 19000, "return_value": 0}, {"a0": -100, "a1": 20000, "return_value": 0},
        ],
        "ops": ["traverse_directory_hilbert_tree", "load_inode_pixels", "free_block_pixels"]
    },
}

# Syscall number mapping
SYSCALL_NUMBERS = {
    "openat": 56,
    "pipe": 59,
    "close": 57,
    "exit": 93,
    "wait": 61,
    "unlink": 35,
}

def generate_syscall(name, example_data, ops):
    """Generate a single syscall entry."""
    syscall_entry = {
        "syscall": {
            "name": name,
            "number": SYSCALL_NUMBERS[name]
        },
        "arguments": {"a0": 0, "a1": 0, "a2": 0, "a3": 0, "a4": 0, "a5": 0},
        "return_value": 0,
        "semantics": {"spatial_ops": ops.copy()}
    }

    # Set return value
    syscall_entry["return_value"] = example_data["return_value"]

    # Set arguments based on syscall type
    if name == "openat":
        syscall_entry["arguments"]["a0"] = example_data["dirfd"]
        syscall_entry["arguments"]["a1"] = example_data["path_ptr"]
        syscall_entry["arguments"]["a2"] = example_data["flags"]
        syscall_entry["arguments"]["a3"] = example_data["mode"]
    elif name == "wait":
        syscall_entry["arguments"]["a0"] = example_data["a0"]
        syscall_entry["arguments"]["a1"] = example_data["a1"]
    elif name == "unlink":
        syscall_entry["arguments"]["a0"] = example_data["a0"]
        syscall_entry["arguments"]["a1"] = example_data["a1"]
    elif name == "exit":
        syscall_entry["arguments"]["a0"] = example_data["a0"]
    elif name == "close":
        syscall_entry["arguments"]["a0"] = example_data["fd"]

    return syscall_entry

def main():
    for syscall_name, config in SYNTHETIC_DATA.items():
        data = {
            "trace_name": f"synthetic_{syscall_name}",
            "syscalls": []
        }

        for example in config["data"]:
            syscall_entry = generate_syscall(syscall_name, example, config["ops"])
            data["syscalls"].append(syscall_entry)

        output_file = SYNTHETIC_DIR / f"synthetic_{syscall_name}.json"
        output_file.write_text(json.dumps(data, indent=2))
        print(f"✓ Generated {len(data['syscalls'])} {syscall_name} examples")

    print(f"\nAll synthetic traces written to: {SYNTHETIC_DIR}")

if __name__ == "__main__":
    main()