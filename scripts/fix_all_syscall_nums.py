#!/usr/bin/env python3
"""Fix all syscall numbers to match real trace values."""
import json
from pathlib import Path

SYNTHETIC_DIR = Path("/home/jericho/projects/zion/projects/geometry_os/geometry_os/traces/synthetic")

# Correct syscall numbers from real traces
SYSCALL_NUMBERS = {
    "close": 7,
    "exit": 1,
    "fork": 2,
    "fstat": 5,
    "getpid": 11,
    "openat": 15,
    "pipe": 8,
    "read": 3,
    "rmdir": 20,
    "unlink": 21,
    "wait": 12,
    "write": 16,
}

for file_path in SYNTHETIC_DIR.glob("synthetic_*.json"):
    try:
        data = json.loads(file_path.read_text())

        if "syscalls" not in data or not data["syscalls"]:
            continue

        syscall_name = data["syscalls"][0]["syscall"]["name"]
        if syscall_name not in SYSCALL_NUMBERS:
            continue

        correct_number = SYSCALL_NUMBERS[syscall_name]

        for syscall in data["syscalls"]:
            syscall["syscall"]["number"] = correct_number

        file_path.write_text(json.dumps(data, indent=2))
        print(f"✓ Fixed {file_path.name}: {syscall_name} -> {correct_number}")
    except Exception as e:
        print(f"Warning: Could not process {file_path}: {e}")

print("\nDone!")