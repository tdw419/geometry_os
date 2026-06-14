#!/usr/bin/env python3
"""Extract real syscall examples and regenerate all synthetic traces."""
import json
from pathlib import Path

PROJECT_ROOT = Path("/home/jericho/projects/zion/projects/geometry_os/geometry_os")
TRACE_DIRS = [PROJECT_ROOT / "traces" / "parsed", PROJECT_ROOT / "traces" / "synthetic"]
SYNTHETIC_DIR = PROJECT_ROOT / "traces" / "synthetic"

# Target syscalls to extract
TARGET_SYSCALLS = ["pipe", "close", "exit", "wait", "unlink", "openat"]

def extract_syscalls(syscall_name, min_count=20):
    """Extract examples of a specific syscall from real traces."""
    examples = []

    for trace_dir in TRACE_DIRS:
        if not trace_dir.exists():
            continue

        for trace_file in trace_dir.glob("*.json"):
            if trace_file.name.startswith(f"synthetic_{syscall_name}"):
                continue  # Skip existing synthetic

            try:
                data = json.loads(trace_file.read_text())
                if "syscalls" not in data:
                    continue

                for syscall in data["syscalls"]:
                    if syscall["syscall"]["name"] != syscall_name:
                        continue

                    # Get spatial ops
                    spatial_ops = syscall.get("semantics", {}).get("spatial_ops", [])
                    if not spatial_ops:
                        continue  # Skip if no spatial ops

                    # Copy the syscall
                    example = {
                        "syscall": syscall["syscall"].copy(),
                        "arguments": syscall["arguments"].copy(),
                        "return_value": syscall.get("return_value", 0),
                        "semantics": {"spatial_ops": spatial_ops.copy()}
                    }
                    examples.append(example)

                    if len(examples) >= min_count:
                        return examples
            except Exception as e:
                print(f"Warning: Could not parse {trace_file}: {e}")

    return examples

# Extract for each syscall
for syscall_name in TARGET_SYSCALLS:
    examples = extract_syscalls(syscall_name, min_count=20)

    if not examples:
        print(f"No examples found for {syscall_name}, skipping")
        continue

    # Write to synthetic file
    output_data = {
        "trace_name": f"synthetic_{syscall_name}",
        "syscalls": examples
    }

    output_file = SYNTHETIC_DIR / f"synthetic_{syscall_name}.json"
    output_file.write_text(json.dumps(output_data, indent=2))
    print(f"✓ {syscall_name}: {len(examples)} examples -> {output_file.name}")

print("\nDone!")