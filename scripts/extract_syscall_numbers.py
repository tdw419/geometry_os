#!/usr/bin/env python3
"""Extract correct syscall numbers from real traces."""
import json
from pathlib import Path

PARSED_DIR = Path("/home/jericho/projects/zion/projects/geometry_os/geometry_os/traces/parsed")

syscall_numbers = {}

for trace_file in PARSED_DIR.glob("*.json"):
    try:
        data = json.loads(trace_file.read_text())
        if "syscalls" not in data:
            continue

        for syscall in data["syscalls"]:
            name = syscall["syscall"]["name"]
            number = syscall["syscall"]["number"]
            if name not in syscall_numbers:
                syscall_numbers[name] = set()
            syscall_numbers[name].add(number)
    except:
        pass

print("Syscall numbers from real traces:")
for name, numbers in sorted(syscall_numbers.items()):
    print(f"  {name}: {sorted(numbers)}")