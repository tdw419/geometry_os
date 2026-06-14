#!/usr/bin/env python3
"""
Complete regeneration of synthetic traces with argument patterns that match real traces.
Uses real trace argument patterns as templates.
"""
import json
import random
from pathlib import Path

PROJECT_ROOT = Path("/home/jericho/projects/zion/projects/geometry_os/geometry_os")
PARSED_DIR = PROJECT_ROOT / "traces" / "parsed"
SYNTHETIC_DIR = PROJECT_ROOT / "traces" / "synthetic"

# Templates from real traces
REAL_TEMPLATES = {
    "write": {
        "count": 20,
        "examples": [
            {"a0": 3, "a1": 2147479368, "a2": 1, "a3": 0, "a4": 4308, "a5": 1},
            {"a0": 4, "a1": 2147478848, "a2": 4602, "a3": 2147479336, "a4": 4308, "a5": 1},
        ],
        "ops": ["copy_pixels_to_block_region"]
    },
    "openat": {
        "count": 20,
        "examples": [
            {"a0": 4276, "a1": 2, "a2": 2152761456, "a3": 3, "a4": 1, "a5": 0},
            {"a0": 2147483640, "a1": 0, "a2": 4585, "a3": 2147479368, "a4": 4308, "a5": 1},
        ],
        "ops": ["traverse_directory_hilbert_tree", "load_inode_pixels"]
    },
    "pipe": {
        "count": 20,
        "examples": [
            {"a0": 2147479368, "a1": 4308, "a2": 4576, "a3": 0, "a4": 0, "a5": 0},
        ],
        "ops": ["allocate_pipe_buffer_pixels"]
    },
    "close": {
        "count": 20,
        "examples": [
            {"a0": 3, "a1": 2147479471, "a2": 1, "a3": 3, "a4": 97, "a5": 100},
            {"a0": 4, "a1": 2147479336, "a2": 4602, "a3": 2147479368, "a4": 4308, "a5": 1},
        ],
        "ops": ["free_fd_table_pixels"]
    },
    "exit": {
        "count": 20,
        "examples": [
            {"a0": 0, "a1": 2147479471, "a2": 1, "a3": 3, "a4": 4586, "a5": 102},
            {"a0": 1, "a1": 0, "a2": 0, "a3": 0, "a4": 0, "a5": 0},
        ],
        "ops": ["free_user_memory"]
    },
    "wait": {
        "count": 20,
        "examples": [
            {"a0": 88, "a1": 102, "a2": 4212, "a3": 3, "a4": 4576, "a5": 0},
        ],
        "ops": ["scan_process_table_pixels", "free_zombie_pixels"]
    },
    "unlink": {
        "count": 20,
        "examples": [
            {"a0": 4276, "a1": 2, "a2": 0, "a3": 0, "a4": 0, "a5": 0},
            {"a0": 2147483640, "a1": 4585, "a2": 0, "a3": 0, "a4": 0, "a5": 0},
        ],
        "ops": ["traverse_directory_hilbert_tree", "load_inode_pixels", "free_block_pixels"]
    },
    "rmdir": {
        "count": 20,
        "examples": [
            {"a0": 2152726528, "a1": 0, "a2": 0, "a3": 0, "a4": 0, "a5": 0},
            {"a0": 2152726784, "a1": 0, "a2": 0, "a3": 0, "a4": 0, "a5": 0},
        ],
        "ops": ["traverse_directory_hilbert_tree", "load_inode_pixels", "free_block_pixels"]
    },
    "fork": {
        "count": 10,
        "examples": [
            {"a0": 0, "a1": 0, "a2": 0, "a3": 0, "a4": 0, "a5": 0},
        ],
        "ops": ["allocate_process_pixels", "duplicate_hilbert_regions"]
    },
    "fstat": {
        "count": 20,
        "examples": [
            {"a0": 3, "a1": 2147479471, "a2": 1, "a3": 3, "a4": 97, "a5": 100},
        ],
        "ops": ["read_inode_pixels", "write_stat_pixels"]
    },
    "read": {
        "count": 20,
        "examples": [
            {"a0": 3, "a1": 2147479368, "a2": 512, "a3": 2147479336, "a4": 4308, "a5": 1},
        ],
        "ops": ["read_inode_pixels", "copy_pixels_from_block_region"]
    },
    "getpid": {
        "count": 10,
        "examples": [
            {"a0": 0, "a1": 0, "a2": 0, "a3": 0, "a4": 0, "a5": 0},
        ],
        "ops": ["scan_process_table_pixels"]
    },
}

SYSCALL_NUMBERS = {
    "write": 64,
    "openat": 56,
    "pipe": 59,
    "close": 57,
    "exit": 93,
    "wait": 61,
    "unlink": 35,
    "rmdir": 79,
    "fork": 220,
    "fstat": 80,
    "read": 63,
    "getpid": 172,
}

def generate_variants(base_args, count):
    """Generate variants of base arguments."""
    variants = []
    for i in range(count):
        variant = {}
        for key in base_args:
            val = base_args[key]
            if val == 0:
                variant[key] = 0
            elif 2147470000 < val < 2147500000:  # Stack addresses
                variant[key] = val + (i * 100)
            elif 2000000000 < val < 3000000000:  # Kernel addresses
                variant[key] = val + (i * 500)
            elif 4000 < val < 5000:  # Small fds/addresses
                variant[key] = val + (i % 5)
            else:
                variant[key] = val + i
        variants.append(variant)
    return variants

def regenerate_all():
    """Regenerate all synthetic traces."""
    for syscall_name, config in REAL_TEMPLATES.items():
        examples = config["examples"]
        ops = config["ops"]
        count = config["count"]

        syscalls = []

        # Generate from templates
        for i, template in enumerate(examples):
            num_from_this = max(1, count // len(examples))
            variants = generate_variants(template, num_from_this)

            for args in variants:
                syscalls.append({
                    "syscall": {
                        "number": SYSCALL_NUMBERS[syscall_name],
                        "name": syscall_name,
                        "description": f"{syscall_name} syscall"
                    },
                    "arguments": args,
                    "return_value": 0 if syscall_name in ["exit", "pipe", "fork"] else (args["a0"] % 10 + 3) if syscall_name == "openat" else 0,
                    "semantics": {
                        "spatial_ops": ops.copy()
                    }
                })

        # Trim to exact count
        syscalls = syscalls[:count]

        output = {
            "trace_name": f"synthetic_{syscall_name}",
            "syscalls": syscalls
        }

        output_file = SYNTHETIC_DIR / f"synthetic_{syscall_name}.json"
        output_file.write_text(json.dumps(output, indent=2))
        print(f"✓ {syscall_name}: {len(syscalls)} examples")

regenerate_all()
print("\nDone!")