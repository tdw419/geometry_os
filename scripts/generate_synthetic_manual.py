#!/usr/bin/env python3
"""
Manual synthetic trace generation based on existing patterns.
Creates balanced syscall examples without Ollama.
"""

import json
from pathlib import Path
import random

OUTPUT_DIR = Path("traces/synthetic")
OUTPUT_DIR.mkdir(parents=True, exist_ok=True)

# Base patterns from existing traces
BASE_PATTERNS = {
    "pipe": {
        "number": 8,
        "spatial_ops": ["allocate_pipe_buffer_pixels"],
        "args_template": {"a0": "pipefds_addr"},
        "ret_range": (0, 0),  # Always 0 on success
        "pc_base": 0x2000000
    },
    "read": {
        "number": 3,
        "spatial_ops": ["copy_pixels_from_block_region"],
        "args_template": {"a0": "fd", "a1": "buffer", "a2": "count"},
        "ret_range": (0, 4096),  # Bytes read
        "pc_base": 0x1000000
    },
    "close": {
        "number": 7,
        "spatial_ops": ["free_fd_table_pixels"],
        "args_template": {"a0": "fd"},
        "ret_range": (0, 0),  # Always 0 on success
        "pc_base": 0x3000000
    },
    "wait": {
        "number": 12,
        "spatial_ops": ["scan_process_table_pixels", "free_zombie_pixels"],
        "args_template": {"a0": "status_addr"},
        "ret_range": (1, 1000),  # Child PID
        "pc_base": 0x4000000
    },
    "exit": {
        "number": 1,
        "spatial_ops": ["free_user_memory"],
        "args_template": {"a0": "exit_code"},
        "ret_range": (0, 255),  # Exit code (though never returns)
        "pc_base": 0x5000000
    },
    "unlink": {
        "number": 21,
        "spatial_ops": ["free_inode_pixels", "free_block_pixels"],
        "args_template": {"a0": "pathname_addr"},
        "ret_range": (0, 0),  # Always 0 on success
        "pc_base": 0x6000000
    },
    "rmdir": {
        "number": 20,
        "spatial_ops": ["free_inode_pixels"],
        "args_template": {"a0": "pathname_addr"},
        "ret_range": (0, 0),
        "pc_base": 0x7000000
    },
    "getpid": {
        "number": 11,
        "spatial_ops": [],
        "args_template": {},
        "ret_range": (1, 1000),  # PID
        "pc_base": 0x8000000
    }
}


def random_hex(base: int, offset: int = None) -> str:
    """Generate a random hex address."""
    if offset is not None:
        return f"0x{base + offset:X}"
    return f"0x{base + random.randint(0, 0xFFFF):X}"


def generate_syscall_record(name: str, pattern: dict, idx: int) -> dict:
    """Generate a single syscall record."""
    pc_base = pattern["pc_base"]
    pc_offset = idx * 0x1000

    # Generate arguments
    args = {
        "a0": 0,
        "a1": 0,
        "a2": 0,
        "a3": 0,
        "a4": 0,
        "a5": 0
    }

    if name == "pipe":
        args["a0"] = int(random_hex(0x7FFFE000, idx * 8), 16)  # pipefds array

    elif name == "read":
        args["a0"] = random.randint(0, 10)  # fd
        args["a1"] = int(random_hex(0x80500000, idx * 4096), 16)  # buffer
        args["a2"] = random.randint(1, 4096)  # count

    elif name == "close":
        args["a0"] = random.randint(0, 10)  # fd

    elif name == "wait":
        args["a0"] = int(random_hex(0x7FFFE000, idx * 4), 16)  # status addr

    elif name == "exit":
        args["a0"] = random.randint(0, 255)  # exit code

    elif name == "unlink":
        args["a0"] = int(random_hex(0x80500000, idx * 256), 16)  # pathname

    elif name == "rmdir":
        args["a0"] = int(random_hex(0x80500000, idx * 256), 16)  # pathname

    # Generate return value
    ret_min, ret_max = pattern["ret_range"]
    ret_val = random.randint(ret_min, ret_max)

    return {
        "syscall": {
            "number": pattern["number"],
            "name": name,
            "description": BASE_PATTERNS[name]["spatial_ops"][0] if BASE_PATTERNS[name]["spatial_ops"] else name
        },
        "arguments": args,
        "return_value": ret_val,
        "program_counter": {
            "ecall_entry": pc_base + pc_offset,
            "sret_return": pc_base + pc_offset + 0x100
        },
        "semantics": {
            "spatial_ops": pattern["spatial_ops"]
        },
        "write_analysis": {},
        "read_analysis": {},
        "fork_analysis": {},
        "openat_analysis": {},
        "close_analysis": {},
        "unlink_analysis": {},
        "wait_analysis": {}
    }


def generate_syscall_batch(name: str, count: int = 20):
    """Generate a batch of syscalls."""
    pattern = BASE_PATTERNS[name]
    records = [generate_syscall_record(name, pattern, i) for i in range(count)]

    output = {
        "metadata": {
            "source": f"synthetic_manual_{name}",
            "total_pairs": len(records),
            "unique_syscalls": 1,
            "generated_by": "manual_pattern_generator"
        },
        "statistics": {
            "total_syscalls": len(records),
            "syscall_counts": {name: len(records)},
            "unique_syscalls": 1
        },
        "syscalls": records
    }

    output_file = OUTPUT_DIR / f"synthetic_{name}.json"
    output_file.write_text(json.dumps(output, indent=2))

    return len(records)


def main():
    print("=" * 70)
    print("MANUAL SYNTHETIC TRACE GENERATION")
    print("=" * 70)

    total = 0
    # Generate 20 examples for each underrepresented syscall
    for name in ["pipe", "read", "close", "wait", "exit", "unlink", "rmdir", "getpid"]:
        count = generate_syscall_batch(name, count=20)
        print(f"  ✓ Generated {count} {name} traces")
        total += count

    print("\n" + "=" * 70)
    print(f"Total synthetic traces generated: {total}")
    print(f"Output directory: {OUTPUT_DIR}")
    print("=" * 70)


if __name__ == "__main__":
    main()