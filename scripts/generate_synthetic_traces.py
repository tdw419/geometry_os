#!/usr/bin/env python3
"""
Synthetic Syscall Trace Generation using Ollama.
Generates realistic syscall sequences to balance the training dataset.
"""

import json
import subprocess
import re
from pathlib import Path
from typing import List, Dict
import random

# Ollama configuration
OLLAMA_MODEL = "qwen2.5-coder:14b"
OLLAMA_ASK = "/home/jericho/zion/bin/ollama-ask"

# Data paths
TRACE_DIR = Path("/home/jericho/projects/zion/projects/geometry_os/geometry_os/traces/parsed")
OUTPUT_DIR = Path("/home/jericho/projects/zion/projects/geometry_os/geometry_os/traces/synthetic")
OUTPUT_DIR.mkdir(parents=True, exist_ok=True)

# Syscall semantics from parse_xv6_syscalls.py
SYSCALL_SEMANTICS = {
    "fork": {
        "description": "Create child process (copy parent)",
        "args": [],
        "returns": "child_pid_to_parent_0_to_child",
        "memory_ops": ["copy_user_memory", "allocate_process_table_entry", "copy_fd_table"],
        "spatial_ops": ["duplicate_hilbert_regions", "allocate_process_pixels"]
    },
    "pipe": {
        "description": "Create pipe",
        "args": ["pipefds"],
        "returns": "0_or_error",
        "memory_ops": ["allocate_pipe_buffer", "fd_table_alloc_2"],
        "spatial_ops": ["allocate_pipe_buffer_pixels"]
    },
    "read": {
        "description": "Read from file descriptor",
        "args": ["fd", "buffer", "count"],
        "returns": "bytes_read_or_error",
        "memory_ops": ["buffer_copy_from_kernel", "block_cache_read"],
        "spatial_ops": ["copy_pixels_from_block_region"]
    },
    "write": {
        "description": "Write to file descriptor",
        "args": ["fd", "buffer", "count"],
        "returns": "bytes_written_or_error",
        "memory_ops": ["buffer_copy_to_kernel", "console_write", "block_cache_write"],
        "spatial_ops": ["copy_pixels_to_console", "copy_pixels_to_block_region"]
    },
    "close": {
        "description": "Close file descriptor",
        "args": ["fd"],
        "returns": "0_or_error",
        "memory_ops": ["fd_table_cleanup", "file_handle_release"],
        "spatial_ops": ["free_fd_table_pixels"]
    },
    "wait": {
        "description": "Wait for child process",
        "args": ["status"],
        "returns": "child_pid_or_error",
        "memory_ops": ["process_table_scan", "reap_zombie"],
        "spatial_ops": ["scan_process_table_pixels", "free_zombie_pixels"]
    },
    "exit": {
        "description": "Terminate current process",
        "args": ["exit_code"],
        "returns": "never",
        "memory_ops": ["process_table_cleanup", "fd_table_cleanup"],
        "spatial_ops": ["free_user_memory"]
    },
    "unlink": {
        "description": "Delete file",
        "args": ["pathname"],
        "returns": "0_or_error",
        "memory_ops": ["namei_path_resolution", "inode_free", "block_free"],
        "spatial_ops": ["free_inode_pixels", "free_block_pixels"]
    }
}


def analyze_current_distribution():
    """Analyze current dataset to find underrepresented syscalls."""
    print("Analyzing current dataset distribution...")
    
    syscall_counts = {}
    
    for json_file in TRACE_DIR.glob("*.json"):
        try:
            data = json.loads(json_file.read_text())
            for syscall in data.get("syscalls", []):
                name = syscall["syscall"]["name"]
                syscall_counts[name] = syscall_counts.get(name, 0) + 1
        except Exception as e:
            print(f"Error reading {json_file}: {e}")
    
    total = sum(syscall_counts.values())
    
    print("\nCurrent distribution:")
    for name, count in sorted(syscall_counts.items(), key=lambda x: -x[1]):
        pct = count / total * 100
        print(f"  {name:15s}: {count:3d} calls ({pct:5.2f}%)")
    
    # Find underrepresented syscalls (< 20 examples)
    underrepresented = {name: count for name, count in syscall_counts.items() if count < 20}
    
    print(f"\nUnderrepresented syscalls (< 20 examples):")
    for name, count in sorted(underrepresented.items(), key=lambda x: x[1]):
        needed = 20 - count
        print(f"  {name:15s}: {count:3d} calls (need {needed} more)")
    
    return syscall_counts, underrepresented


def generate_ollama_prompt(syscall_name: str, count: int) -> str:
    """Generate a prompt for Ollama to create synthetic syscall traces."""
    
    semantics = SYSCALL_SEMANTICS.get(syscall_name, {})
    spatial_ops = semantics.get("spatial_ops", [])
    memory_ops = semantics.get("memory_ops", [])
    args = semantics.get("args", [])
    
    prompt = f"""You are an expert RISC-V system call simulator. Generate {count} realistic examples of the '{syscall_name}' syscall for xv6 on RISC-V.

Syscall details:
- Description: {semantics.get("description", "N/A")}
- Arguments: {args if args else "none"}
- Returns: {semantics.get("returns", "N/A")}
- Memory operations: {memory_ops}
- Spatial operations: {spatial_ops}

For each example, generate:
1. Realistic register values (a0-a5) matching the syscall signature
2. A return value consistent with success/failure scenarios
3. Program counter addresses (entry and return)

Format each example as JSON:
```json
{{
  "syscall": {{
    "number": <syscall_number>,
    "name": "{syscall_name}",
    "description": "{semantics.get("description", "")}"
  }},
  "arguments": {{
    "a0": <hex_value>,
    "a1": <hex_value>,
    "a2": <hex_value>,
    "a3": <hex_value>,
    "a4": <hex_value>,
    "a5": <hex_value>
  }},
  "return_value": <decimal_value>,
  "program_counter": {{
    "ecall_entry": <hex_address>,
    "sret_return": <hex_address>
  }},
  "semantics": {{
    "description": "{semantics.get("description", "")}",
    "args": {json.dumps(args)},
    "returns": "{semantics.get("returns", "")}",
    "memory_ops": {json.dumps(memory_ops)},
    "spatial_ops": {json.dumps(spatial_ops)}
  }}
}}
```

Generate {count} diverse examples with varying:
- Argument values (file descriptors, buffer addresses, sizes)
- Return values (success and error cases)
- Program counter addresses

Return ONLY the JSON array, no other text.
"""
    return prompt


def call_ollama(prompt: str) -> str:
    """Call Ollama to generate synthetic traces."""
    try:
        # Write prompt to temp file
        temp_prompt = Path("/tmp/ollama_prompt.txt")
        temp_prompt.write_text(prompt)
        
        # Call ollama-ask
        result = subprocess.run(
            [OLLAMA_ASK, "-m", OLLAMA_MODEL, "-f", str(temp_prompt)],
            capture_output=True,
            text=True,
            timeout=120
        )
        
        if result.returncode != 0:
            print(f"Ollama error: {result.stderr}")
            return ""
        
        return result.stdout
    
    except subprocess.TimeoutExpired:
        print("Ollama timeout")
        return ""
    except Exception as e:
        print(f"Error calling Ollama: {e}")
        return ""


def parse_ollama_response(response: str, syscall_name: str) -> List[Dict]:
    """Parse Ollama response into syscall records."""
    try:
        # Try to extract JSON array
        json_match = re.search(r'\[.*\]', response, re.DOTALL)
        if not json_match:
            print(f"  No JSON found in response for {syscall_name}")
            return []
        
        json_str = json_match.group(0)
        records = json.loads(json_str)
        
        # Validate structure
        valid_records = []
        for record in records:
            if "syscall" in record and "arguments" in record:
                # Add analysis fields
                record["write_analysis"] = {}
                record["read_analysis"] = {}
                record["fork_analysis"] = {}
                record["openat_analysis"] = {}
                record["close_analysis"] = {}
                record["unlink_analysis"] = {}
                record["wait_analysis"] = {}
                valid_records.append(record)
        
        return valid_records
    
    except json.JSONDecodeError as e:
        print(f"  JSON parse error for {syscall_name}: {e}")
        return []
    except Exception as e:
        print(f"  Error parsing response for {syscall_name}: {e}")
        return []


def generate_synthetic_trace(syscall_name: str, count: int) -> List[Dict]:
    """Generate synthetic syscall traces using Ollama."""
    print(f"\nGenerating {count} synthetic traces for {syscall_name}...")
    
    prompt = generate_ollama_prompt(syscall_name, count)
    response = call_ollama(prompt)
    
    if not response:
        print(f"  ✗ No response from Ollama")
        return []
    
    records = parse_ollama_response(response, syscall_name)
    
    print(f"  ✓ Generated {len(records)} valid traces")
    return records


def save_synthetic_trace(syscall_name: str, records: List[Dict]):
    """Save synthetic traces to JSON file."""
    output = {
        "metadata": {
            "source": f"synthetic_ollama_{syscall_name}",
            "total_pairs": len(records),
            "unique_syscalls": 1,
            "generated_by": "Ollama " + OLLAMA_MODEL
        },
        "statistics": {
            "total_syscalls": len(records),
            "syscall_counts": {syscall_name: len(records)},
            "unique_syscalls": 1
        },
        "syscalls": records
    }
    
    output_file = OUTPUT_DIR / f"synthetic_{syscall_name}.json"
    output_file.write_text(json.dumps(output, indent=2))
    
    print(f"  ✓ Saved to {output_file}")


def run_augmentation():
    """Run the full data augmentation pipeline."""
    print("=" * 70)
    print("SYNTHETIC SYSCALL TRACE GENERATION (Ollama)")
    print("=" * 70)
    
    # Analyze current distribution
    syscall_counts, underrepresented = analyze_current_distribution()
    
    if not underrepresented:
        print("\n✓ All syscalls have sufficient examples (>= 20)")
        return
    
    # Generate synthetic traces for underrepresented syscalls
    print("\n" + "=" * 70)
    print("GENERATING SYNTHETIC TRACES")
    print("=" * 70)
    
    total_generated = 0
    
    for syscall_name, current_count in sorted(underrepresented.items(), key=lambda x: x[1]):
        needed = 20 - current_count
        
        # Generate slightly more to account for invalid parses
        to_generate = min(needed + 5, 30)  # Cap at 30 per syscall
        
        records = generate_synthetic_trace(syscall_name, to_generate)
        
        if records:
            save_synthetic_trace(syscall_name, records)
            total_generated += len(records)
    
    # Summary
    print("\n" + "=" * 70)
    print("AUGMENTATION SUMMARY")
    print("=" * 70)
    print(f"Synthetic traces generated: {total_generated}")
    print(f"Output directory: {OUTPUT_DIR}")
    print(f"Model: {OLLAMA_MODEL}")
    print("\nNext steps:")
    print("  1. Review synthetic traces for quality")
    print("  2. Retrain model with augmented dataset")
    print("  3. Run VCC validation")
    print("=" * 70)


if __name__ == "__main__":
    run_augmentation()