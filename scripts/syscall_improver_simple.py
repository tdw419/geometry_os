#!/usr/bin/env python3
"""
Simplify operations: Just run VCC, get baseline, and schedule periodic checks.
"""

import subprocess
import time
from pathlib import Path
from datetime import datetime

PROJECT_ROOT = Path("/home/jericho/projects/zion/projects/geometry_os/geometry_os")
SCRIPTS_DIR = PROJECT_ROOT / "scripts"
SYNTHETIC_DIR = PROJECT_ROOT / "traces" / "synthetic"

OLLAMA_ASK = Path.home() / "zion" / "bin" / "ollama-ask"
OLLAMA_MODEL = "qwen2.5-coder:14b"

def run_vcc():
    """Run VCC and get overall accuracy."""
    result = subprocess.run(
        ["python3", str(SCRIPTS_DIR / "vcc_validation_simple.py")],
        capture_output=True,
        text=True,
        timeout=600
    )

    for line in result.stdout.split('\n'):
        if "Overall mapping accuracy" in line:
            try:
                pct = line.split(':')[1].strip()
                return float(pct.replace('%', ''))
            except:
                pass

    return None

def generate_openat_traces():
    """Generate corrected openat traces."""
    system = """You are an expert in RISC-V XV6 openat syscall semantics and Memory Palace spatial operations.
The openat syscall needs these specific spatial operations:
1. traverse_directory_hilbert_tree - navigate directory structure
2. load_inode_pixels - load inode metadata

Generate correct traces with these spatial ops."""

    prompt = """Generate 20 synthetic openat syscall traces for XV6 RISC-V.

IMPORTANT: Each openat MUST have these spatial_ops:
- "traverse_directory_hilbert_tree"
- "load_inode_pixels"

Openat semantics:
- AT_FDCWD: use current working directory
- Returns file descriptor on success, -1 on error
- Arguments: dirfd (int), pathname (pointer), flags (int), mode (int)

Return ONLY valid JSON in this format:
{
  "trace_name": "synthetic_openat",
  "syscalls": [
    {
      "syscall": {"name": "openat", "number": 56},
      "arguments": {"a0": -100, "a1": <path_ptr>, "a2": <flags>, "a3": <mode>, "a4": 0, "a5": 0},
      "return_value": <fd>,
      "semantics": {"spatial_ops": ["traverse_directory_hilbert_tree", "load_inode_pixels"]}
    }
  ]
}

Pure JSON only. No explanation."""

    # Write prompt to temp file
    temp_file = Path("/tmp/ollama_openat_prompt.txt")
    temp_file.write_text(prompt)

    # Call ollama-ask
    result = subprocess.run(
        [str(OLLAMA_ASK), "-m", OLLAMA_MODEL, "-s", system, "-f", str(temp_file)],
        capture_output=True,
        text=True,
        timeout=120
    )

    if result.returncode == 0:
        # Parse JSON
        import json
        try:
            data = json.loads(result.stdout)
            output_file = SYNTHETIC_DIR / "synthetic_openat.json"
            output_file.write_text(json.dumps(data, indent=2))
            print(f"✓ Generated {len(data.get('syscalls', []))} openat traces")
            return True
        except json.JSONDecodeError as e:
            print(f"✗ Failed to parse openat response: {e}")
            # Save raw response for debugging
            debug_file = SYNTHETIC_DIR / "synthetic_openat_debug.txt"
            debug_file.write_text(result.stdout)
            return False
    else:
        print(f"✗ Ollama failed: {result.stderr}")
        return False

def main():
    print("=" * 70)
    print("Ollama Syscall Improver - Simple Mode")
    print("=" * 70)

    # Step 1: Get baseline VCC
    print("\n[1/4] Getting baseline VCC...")
    baseline = run_vcc()
    if baseline is None:
        print("ERROR: Cannot get baseline VCC")
        return

    print(f"Baseline VCC: {baseline:.2f}%")

    if baseline >= 95.0:
        print("✓ Already at target! Monitoring mode...")
        # Still try to improve further
        print("Attempting further improvements...")

    # Step 2: Fix openat
    print("\n[2/4] Generating corrected openat traces...")
    openat_success = generate_openat_traces()

    # Step 3: Retrain
    print("\n[3/4] Retraining model...")
    result = subprocess.run(
        ["python3", str(SCRIPTS_DIR / "train_syscall_synthesis.py")],
        capture_output=True,
        text=True,
        timeout=1800
    )

    if result.returncode == 0:
        print("✓ Model retrained")

        # Extract training accuracy
        for line in result.stdout.split('\n'):
            if "Epoch" in line and "Accuracy" in line:
                print(f"  {line}")
    else:
        print(f"✗ Training failed: {result.stderr[:500]}")
        return

    # Step 4: Validate
    print("\n[4/4] Validating new model...")
    new_vcc = run_vcc()

    if new_vcc is None:
        print("ERROR: Cannot get new VCC")
        return

    improvement = new_vcc - baseline
    print(f"New VCC: {new_vcc:.2f}% (change: {improvement:+.2f}%)")

    if improvement > 0:
        print(f"✓ Improvement achieved: +{improvement:.2f}%")
    elif improvement > -1.0:
        print(f"⚠ Minimal change: {improvement:.2f}% (stable)")
    else:
        print(f"⚠ Regression: {improvement:.2f}%")

    print("\n" + "=" * 70)
    print(f"Summary: {baseline:.2f}% → {new_vcc:.2f}% ({improvement:+.2f}%)")
    print("=" * 70)

if __name__ == "__main__":
    main()