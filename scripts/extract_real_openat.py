#!/usr/bin/env python3
"""Add more openat examples from real traces to synthetic training data."""
import json
from pathlib import Path

PROJECT_ROOT = Path("/home/jericho/projects/zion/projects/geometry_os/geometry_os")
TRACE_DIRS = [PROJECT_ROOT / "traces" / "parsed", PROJECT_ROOT / "traces" / "synthetic"]
OUTPUT_FILE = PROJECT_ROOT / "traces" / "synthetic" / "synthetic_openat.json"

# Collect all openat examples from real traces
openat_examples = []

for trace_dir in TRACE_DIRS:
    if not trace_dir.exists():
        continue

    for trace_file in trace_dir.glob("*.json"):
        try:
            data = json.loads(trace_file.read_text())
            if "syscalls" not in data:
                continue

            for syscall in data["syscalls"]:
                if syscall["syscall"]["name"] != "openat":
                    continue

                # Extract data from both arguments and analysis
                args = syscall["arguments"]
                analysis = syscall.get("openat_analysis", {})

                # Use analysis if available, otherwise fall back to args
                if analysis:
                    dirfd = analysis.get("dirfd", args.get("a0", -100))
                    path_ptr = analysis.get("pathname_address", args.get("a1", 0))
                    flags = analysis.get("flags", args.get("a2", 0))
                    mode = analysis.get("mode", args.get("a3", 0))
                else:
                    dirfd = args.get("a0", -100)
                    path_ptr = args.get("a1", 0)
                    flags = args.get("a2", 0)
                    mode = args.get("a3", 0)

                example = {
                    "syscall": {"name": "openat", "number": 56},
                    "arguments": {
                        "a0": dirfd,
                        "a1": path_ptr,
                        "a2": flags,
                        "a3": mode,
                        "a4": 0,
                        "a5": 0
                    },
                    "return_value": syscall.get("return_value", 0),
                    "semantics": {
                        "spatial_ops": syscall["semantics"]["spatial_ops"]
                    }
                }
                openat_examples.append(example)
        except Exception as e:
            print(f"Warning: Could not parse {trace_file}: {e}")

print(f"Found {len(openat_examples)} openat examples")

# Write to output
output_data = {
    "trace_name": "synthetic_openat",
    "syscalls": openat_examples
}

OUTPUT_FILE.write_text(json.dumps(output_data, indent=2))
print(f"✓ Wrote {len(openat_examples)} openat examples to {OUTPUT_FILE}")