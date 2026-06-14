#!/usr/bin/env python3
"""
Generate diverse exit and read examples via Ollama, retrain, and validate.
All local writes, hermetic.
"""

import subprocess
import json
from pathlib import Path

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

def ask_ollama(prompt: str, system: str) -> str:
    """Query Ollama and return response."""
    # Write prompt to temp file
    temp_file = Path("/tmp/ollama_prompt.txt")
    temp_file.write_text(prompt)
    result = subprocess.run(
        [str(OLLAMA_ASK), "-m", OLLAMA_MODEL, "-s", system, "-f", str(temp_file)],
        capture_output=True,
        text=True,
        timeout=120
    )
    return result.stdout if result.returncode == 0 else ""

def generate_exit_examples(count=20):
    """Generate diverse exit examples."""
    system = """You are an expert in RISC-V XV6 exit syscall semantics and Memory Palace spatial operations.
The exit syscall finalizes process termination by freeing memory, closing resources, and updating process structures.

IMPORTANT: Provide diverse spatial_ops for different exit scenarios:
- Success paths: free_user_memory, free_process_struct, free_file_table
- Error paths: free_user_memory, free_process_struct
- Edge cases: free_all_pixel_buffers, free_temporal_hilbert_segments

Generate diverse exit syscall traces with varied patterns:
- Different exit codes (0 for success, 1-255 for errors)
- Different resource states (open files, allocated buffers)
- Different return paths (normal, error, signal)

Return ONLY valid JSON. No explanation."""
    prompt = f"""Generate {count} synthetic exit syscall traces for XV6 RISC-V.

Return ONLY valid JSON in this format:
{{
  "trace_name": "synthetic_exit_diverse",
  "syscalls": [
    {{
      "syscall": {{"name": "exit", "number": 93}},
      "arguments": {{"a0": <exit_code>, "a1": 0, "a2": 0, "a3": 0, "a4": 0, "a5": 0}},
      "return_value": 0,
      "semantics": {{"spatial_ops": ["op1", "op2"]}}
    }}
  ]
}}

Pure JSON only. No explanation."""
    resp = ask_ollama(prompt, system)
    if not resp:
        return False, "Empty Ollama response"
    try:
        data = json.loads(resp)
        # Merge with existing
        existing_file = SYNTHETIC_DIR / "synthetic_exit.json"
        existing_data = {"syscalls": []}
        if existing_file.exists():
            existing_data = json.loads(existing_file.read_text())
        existing_data["syscalls"].extend(data.get("syscalls", []))
        existing_file.write_text(json.dumps(existing_data, indent=2))
        total = len(existing_data["syscalls"])
        return True, f"Added {len(data.get('syscalls', []))} exit examples (total: {total})"
    except json.JSONDecodeError as e:
        return False, f"JSON parse error: {e}"

def generate_read_examples(count=20):
    """Generate diverse read examples."""
    system = """You are an expert in RISC-V XV6 read syscall semantics and Memory Palace spatial operations.
The read syscall reads data from file descriptors into buffers.

IMPORTANT: Provide diverse spatial_ops for different read scenarios:
- Success paths: read_pixels_to_buffer, update_file_offset
- Error paths: nothing (empty spatial_ops) for invalid reads
- Edge cases: read_from_pixel_pipe, copy_pixels_from_virtio

Generate diverse read syscall traces with varied patterns:
- Different buffer sizes (1, 64, 256, 1024, 4096)
- Different file descriptors (0=stdin, 3+ for files/pipes)
- Success and error cases (EOF, bad FD, invalid buffer)

Return ONLY valid JSON. No explanation."""
    prompt = f"""Generate {count} synthetic read syscall traces for XV6 RISC-V.

Return ONLY valid JSON in this format:
{{
  "trace_name": "synthetic_read_diverse",
  "syscalls": [
    {{
      "syscall": {{"name": "read", "number": 63}},
      "arguments": {{"a0": <fd>, "a1": <buf_ptr>, "a2": <count>, "a3": 0, "a4": 0, "a5": 0}},
      "return_value": <bytes_read_or_error>,
      "semantics": {{"spatial_ops": ["op1", "op2"]}}
    }}
  ]
}}

Pure JSON only. No explanation."""
    resp = ask_ollama(prompt, system)
    if not resp:
        return False, "Empty Ollama response"
    try:
        data = json.loads(resp)
        # Merge with existing
        existing_file = SYNTHETIC_DIR / "synthetic_read.json"
        existing_data = {"syscalls": []}
        if existing_file.exists():
            existing_data = json.loads(existing_file.read_text())
        existing_data["syscalls"].extend(data.get("syscalls", []))
        existing_file.write_text(json.dumps(existing_data, indent=2))
        total = len(existing_data["syscalls"])
        return True, f"Added {len(data.get('syscalls', []))} read examples (total: {total})"
    except json.JSONDecodeError as e:
        return False, f"JSON parse error: {e}"

def retrain():
    """Retrain the model."""
    result = subprocess.run(
        ["python3", str(SCRIPTS_DIR / "train_syscall_synthesis.py")],
        capture_output=True,
        text=True,
        timeout=1800
    )
    if result.returncode != 0:
        return False, result.stderr[:500]
    acc_lines = [line for line in result.stdout.split('\n') if "Epoch" in line and "Accuracy" in line]
    return True, "\n".join(acc_lines[-3:])  # last 3 epochs

def main():
    print("=" * 70)
    print("Exit/Read Example Generation + Retrain + Validate")
    print("=" * 70)

    # Baseline
    print("\n[1/5] Baseline VCC...")
    baseline = run_vcc()
    if baseline is None:
        print("ERROR: Cannot get baseline VCC")
        return
    print(f"Baseline VCC: {baseline:.2f}%")

    # Exit examples
    print("\n[2/5] Generating exit examples via Ollama...")
    exit_ok, exit_msg = generate_exit_examples(20)
    print(exit_msg if exit_ok else f"✗ {exit_msg}")

    # Read examples
    print("\n[3/5] Generating read examples via Ollama...")
    read_ok, read_msg = generate_read_examples(20)
    print(read_msg if read_ok else f"✗ {read_msg}")

    # Retrain
    print("\n[4/5] Retraining model...")
    train_ok, train_msg = retrain()
    print(train_msg if train_ok else f"✗ {train_msg}")
    if not train_ok:
        print("Training failed, stopping.")
        return

    # Validate
    print("\n[5/5] Validating new model...")
    new_vcc = run_vcc()
    if new_vcc is None:
        print("ERROR: Cannot get new VCC")
        return
    improvement = new_vcc - baseline
    print(f"New VCC: {new_vcc:.2f}% (change: {improvement:+.2f}%)")

    print("\n" + "=" * 70)
    print(f"Summary: {baseline:.2f}% → {new_vcc:.2f}% ({improvement:+.2f}%)")
    print("=" * 70)

if __name__ == "__main__":
    main()