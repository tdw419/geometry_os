#!/usr/bin/env python3
"""Fix syscall numbers in synthetic traces to match real values."""
import json
from pathlib import Path

PROJECT_ROOT = Path("/home/jericho/projects/zion/projects/geometry_os/geometry_os")
SYNTHETIC_DIR = PROJECT_ROOT / "traces" / "synthetic"

# Correct syscall numbers (from real traces)
SYSCALL_NUMBERS = {
    "openat": 56,
    "pipe": 59,
    "close": 57,
    "exit": 93,
    "wait": 61,
    "unlink": 35,
    "fork": 220,
    "read": 63,
    "write": 64,
    "rmdir": 79,
    "fstat": 80,
    "getpid": 172,
}

for file_path in SYNTHETIC_DIR.glob("synthetic_*.json"):
    try:
        data = json.loads(file_path.read_text())

        # Check if this file has syscalls
        if "syscalls" not in data or not data["syscalls"]:
            continue

        # Get syscall name from first entry
        syscall_name = data["syscalls"][0]["syscall"]["name"]

        # Fix syscall number
        if syscall_name in SYSCALL_NUMBERS:
            correct_number = SYSCALL_NUMBERS[syscall_name]

            for syscall in data["syscalls"]:
                old_number = syscall["syscall"]["number"]
                if old_number != correct_number:
                    syscall["syscall"]["number"] = correct_number

            file_path.write_text(json.dumps(data, indent=2))
            print(f"✓ Fixed {file_path.name}: {syscall_name} -> {correct_number}")
    except Exception as e:
        print(f"Warning: Could not process {file_path}: {e}")

print("\nDone!")