#!/usr/bin/env python3
"""Merge real examples with generated synthetic ones, preserving both."""
import json
from pathlib import Path

PROJECT_ROOT = Path("/home/jericho/projects/zion/projects/geometry_os/geometry_os")
PARSED_DIR = PROJECT_ROOT / "traces" / "parsed"
SYNTHETIC_DIR = PROJECT_ROOT / "traces" / "synthetic"

# Target syscalls
TARGET_SYSCALLS = ["openat", "pipe", "close", "exit", "wait", "unlink"]

# Spatial ops from real traces
SPATIAL_OPS_FROM_REAL = {}

def extract_real_spatial_ops():
    """Extract spatial ops for each syscall from real traces."""
    for syscall_name in TARGET_SYSCALLS:
        ops_set = set()

        for trace_file in PARSED_DIR.glob("*.json"):
            try:
                data = json.loads(trace_file.read_text())
                if "syscalls" not in data:
                    continue

                for syscall in data["syscalls"]:
                    if syscall["syscall"]["name"] != syscall_name:
                        continue

                    ops = syscall.get("semantics", {}).get("spatial_ops", [])
                    ops_set.update(ops)
            except:
                pass

        if ops_set:
            SPATIAL_OPS_FROM_REAL[syscall_name] = list(ops_set)
            print(f"{syscall_name}: {ops_set}")

print("Extracting spatial ops from real traces...")
extract_real_spatial_ops()

def regenerate_synthetic_files():
    """Regenerate synthetic files with 50/50 mix of real and synthetic."""
    for syscall_name in TARGET_SYSCALLS:
        real_ops = SPATIAL_OPS_FROM_REAL.get(syscall_name, [])

        if not real_ops:
            print(f"No real ops found for {syscall_name}, skipping")
            continue

        # Collect real examples
        real_examples = []
        for trace_file in PARSED_DIR.glob("*.json"):
            try:
                data = json.loads(trace_file.read_text())
                if "syscalls" not in data:
                    continue

                for syscall in data["syscalls"]:
                    if syscall["syscall"]["name"] != syscall_name:
                        continue

                    ops = syscall.get("semantics", {}).get("spatial_ops", [])
                    if not ops:
                        continue

                    real_examples.append({
                        "syscall": syscall["syscall"].copy(),
                        "arguments": syscall["arguments"].copy(),
                        "return_value": syscall.get("return_value", 0),
                        "semantics": {"spatial_ops": ops.copy()}
                    })

                    if len(real_examples) >= 10:
                        break
            except:
                pass

        if not real_examples:
            continue

        # Generate synthetic examples to reach 20
        need = 20 - len(real_examples)
        synthetic_examples = []

        for i in range(need):
            # Use same pattern as real examples
            base = real_examples[0]
            synthetic = {
                "syscall": base["syscall"].copy(),
                "arguments": base["arguments"].copy(),
                "return_value": base["return_value"],
                "semantics": {"spatial_ops": base["semantics"]["spatial_ops"].copy()}
            }

            # Vary arguments slightly
            synthetic["arguments"]["a0"] = base["arguments"]["a0"] + (i * 100)
            if "a1" in synthetic["arguments"]:
                synthetic["arguments"]["a1"] = base["arguments"]["a1"] + (i * 100)

            synthetic_examples.append(synthetic)

        # Combine
        all_examples = real_examples + synthetic_examples

        # Write
        output = {
            "trace_name": f"synthetic_{syscall_name}",
            "syscalls": all_examples
        }

        output_file = SYNTHETIC_DIR / f"synthetic_{syscall_name}.json"
        output_file.write_text(json.dumps(output, indent=2))
        print(f"✓ {syscall_name}: {len(real_examples)} real + {len(synthetic_examples)} synthetic")

print("\nRegenerating synthetic files...")
regenerate_synthetic_files()
print("\nDone!")