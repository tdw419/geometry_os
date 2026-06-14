#!/usr/bin/env python3
"""
Batch generate synthetic syscall traces using Ollama.
"""

import json
import subprocess
import re
from pathlib import Path

OLLAMA_ASK = "/home/jericho/zion/bin/ollama-ask"
MODEL = "qwen2.5-coder:14b"
OUTPUT_DIR = Path("traces/synthetic")
OUTPUT_DIR.mkdir(parents=True, exist_ok=True)

# Syscall definitions
SYSCALLS = {
    "pipe": {
        "number": 8,
        "description": "Create pipe",
        "spatial_ops": ["allocate_pipe_buffer_pixels"],
        "arg_hint": "a0=pipefds address (0x7FFFE000+), others=0"
    },
    "read": {
        "number": 3,
        "description": "Read from file descriptor",
        "spatial_ops": ["copy_pixels_from_block_region"],
        "arg_hint": "a0=fd, a1=buffer, a2=count"
    },
    "close": {
        "number": 7,
        "description": "Close file descriptor",
        "spatial_ops": ["free_fd_table_pixels"],
        "arg_hint": "a0=fd to close"
    },
    "wait": {
        "number": 12,
        "description": "Wait for child process",
        "spatial_ops": ["scan_process_table_pixels", "free_zombie_pixels"],
        "arg_hint": "a0=status address"
    },
    "exit": {
        "number": 1,
        "description": "Terminate current process",
        "spatial_ops": ["free_user_memory"],
        "arg_hint": "a0=exit_code"
    },
    "unlink": {
        "number": 21,
        "description": "Delete file",
        "spatial_ops": ["free_inode_pixels", "free_block_pixels"],
        "arg_hint": "a0=pathname address"
    },
    "rmdir": {
        "number": 20,
        "description": "Remove directory",
        "spatial_ops": ["free_inode_pixels"],
        "arg_hint": "a0=pathname address"
    },
    "getpid": {
        "number": 11,
        "description": "Get process ID",
        "spatial_ops": [],
        "arg_hint": "no args"
    }
}


def generate_for_syscall(name: str, info: dict, count: int = 10) -> int:
    """Generate synthetic traces for a specific syscall."""
    prompt = f"""Generate {count} realistic JSON examples of the "{name}" syscall for xv6 RISC-V.

Syscall number: {info['number']}
Description: {info['description']}
Arguments: {info['arg_hint']}
Spatial operations: {info['spatial_ops']}

Format as JSON array. Each example needs:
- syscall: {{number, name, description}}
- arguments: {{a0-a5 as hex strings}}
- return_value: decimal (consistent with success/failure)
- program_counter: {{ecall_entry, sret_return as hex addresses}}
- semantics: {{spatial_ops: [...]}}
- Empty objects for: write_analysis, read_analysis, fork_analysis, openat_analysis, close_analysis, unlink_analysis, wait_analysis

Return ONLY JSON array, no other text, no markdown fences."""

    # Write prompt
    prompt_file = Path("/tmp/ollama_prompt.txt")
    prompt_file.write_text(prompt)

    # Call Ollama
    try:
        result = subprocess.run(
            [OLLAMA_ASK, "-m", MODEL, "-f", str(prompt_file)],
            capture_output=True,
            text=True,
            timeout=60
        )

        if result.returncode != 0:
            print(f"  ✗ Ollama error: {result.stderr}")
            return 0

        # Extract JSON
        json_match = re.search(r'\[.*\]', result.stdout, re.DOTALL)
        if not json_match:
            print(f"  ✗ No JSON found")
            return 0

        records = json.loads(json_match.group())

        # Post-process records
        for r in records:
            # Convert hex strings to int
            r['arguments'] = {k: int(v, 16) if isinstance(v, str) and v.startswith('0x') else v
                             for k, v in r['arguments'].items()}
            r['program_counter'] = {k: int(v, 16) if isinstance(v, str) and v.startswith('0x') else v
                                    for k, v in r['program_counter'].items()}

            # Ensure semantics exists
            if 'semantics' not in r:
                r['semantics'] = {}
            if 'spatial_ops' not in r['semantics']:
                r['semantics']['spatial_ops'] = info['spatial_ops']

            # Add empty analysis fields
            for field in ['write_analysis', 'read_analysis', 'fork_analysis', 'openat_analysis',
                         'close_analysis', 'unlink_analysis', 'wait_analysis']:
                r[field] = {}

        # Save output
        output = {
            'metadata': {
                'source': f'synthetic_ollama_{name}',
                'total_pairs': len(records),
                'unique_syscalls': 1,
                'generated_by': f'Ollama {MODEL}'
            },
            'statistics': {
                'total_syscalls': len(records),
                'syscall_counts': {name: len(records)},
                'unique_syscalls': 1
            },
            'syscalls': records
        }

        output_file = OUTPUT_DIR / f"synthetic_{name}.json"
        output_file.write_text(json.dumps(output, indent=2))

        print(f"  ✓ Generated {len(records)} {name} traces")
        return len(records)

    except subprocess.TimeoutExpired:
        print(f"  ✗ Timeout")
        return 0
    except Exception as e:
        print(f"  ✗ Error: {e}")
        return 0


def main():
    print("=" * 70)
    print("BATCH SYNTHETIC TRACE GENERATION (Ollama)")
    print("=" * 70)

    total = 0
    for name, info in SYSCALLS.items():
        print(f"\nGenerating {name}...")
        count = generate_for_syscall(name, info, count=15)
        total += count

    print("\n" + "=" * 70)
    print(f"Total synthetic traces generated: {total}")
    print(f"Output directory: {OUTPUT_DIR}")
    print("=" * 70)


if __name__ == "__main__":
    main()