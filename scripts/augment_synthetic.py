#!/usr/bin/env python3
"""Augment real examples with synthetic to reach minimum 20 per syscall."""
import json
from pathlib import Path

PROJECT_ROOT = Path("/home/jericho/projects/zion/projects/geometry_os/geometry_os")
SYNTHETIC_DIR = PROJECT_ROOT / "traces" / "synthetic"

# Spatial ops mapping
SYSCALL_OPS = {
    "openat": ["traverse_directory_hilbert_tree", "load_inode_pixels"],
    "pipe": ["allocate_pipe_buffer_pixels"],
    "close": ["free_fd_table_pixels"],
    "exit": ["free_user_memory"],
    "wait": ["scan_process_table_pixels"],
    "unlink": ["traverse_directory_hilbert_tree", "load_inode_pixels", "free_block_pixels"],
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

def augment_syscall(syscall_name, min_count=20):
    """Augment syscall examples with synthetic ones to reach min_count."""
    file_path = SYNTHETIC_DIR / f"synthetic_{syscall_name}.json"

    if not file_path.exists():
        print(f"File not found: {file_path}")
        return

    data = json.loads(file_path.read_text())
    examples = data.get("syscalls", [])

    if len(examples) >= min_count:
        print(f"{syscall_name}: already has {len(examples)} examples, skipping")
        return

    need = min_count - len(examples)
    print(f"{syscall_name}: {len(examples)} examples, need {need} more")

    # Get spatial ops
    spatial_ops = SYSCALL_OPS[syscall_name]

    # Generate synthetic examples
    for i in range(need):
        base_example = examples[0] if examples else None
        new_example = generate_synthetic_example(syscall_name, spatial_ops, len(examples) + i)
        examples.append(new_example)

    # Write back
    output_data = {
        "trace_name": f"synthetic_{syscall_name}",
        "syscalls": examples
    }

    file_path.write_text(json.dumps(output_data, indent=2))
    print(f"  -> wrote {len(examples)} examples to {file_path.name}")

def generate_synthetic_example(syscall_name, spatial_ops, index):
    """Generate a single synthetic example."""
    example = {
        "syscall": {
            "name": syscall_name,
            "number": SYSCALL_NUMBERS[syscall_name]
        },
        "arguments": {"a0": 0, "a1": 0, "a2": 0, "a3": 0, "a4": 0, "a5": 0},
        "return_value": 0,
        "semantics": {"spatial_ops": spatial_ops.copy()}
    }

    # Set arguments based on syscall type
    if syscall_name == "openat":
        example["arguments"]["a0"] = -100 if index % 2 == 0 else (index % 5 + 3)
        example["arguments"]["a1"] = (index + 1) * 1000
        example["arguments"]["a2"] = index % 3  # flags: 0, 1, 2
        example["arguments"]["a3"] = 438 if index % 3 == 2 else 0
        example["return_value"] = (index % 10 + 3) if index % 5 != 4 else -1
    elif syscall_name == "pipe":
        example["return_value"] = 0
    elif syscall_name == "close":
        example["arguments"]["a0"] = (index % 10 + 3)
        example["return_value"] = 0
    elif syscall_name == "exit":
        example["arguments"]["a0"] = index % 256
        example["return_value"] = 0
    elif syscall_name == "wait":
        example["arguments"]["a0"] = (index + 1) * 1000
        example["arguments"]["a1"] = 0
        example["return_value"] = (index % 10 + 1) * 1000
    elif syscall_name == "unlink":
        example["arguments"]["a0"] = -100
        example["arguments"]["a1"] = (index + 1) * 1000
        example["return_value"] = 0 if index % 5 != 4 else -1

    return example

# Augment all syscalls
for syscall_name in SYSCALL_OPS.keys():
    augment_syscall(syscall_name, min_count=20)

print("\nDone!")