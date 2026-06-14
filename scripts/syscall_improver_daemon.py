#!/usr/bin/env python3
"""
Autonomous Daemon: Ollama Syscall Synthesis Improver

Continuously works on improving the syscall synthesis model by:
1. Generating synthetic traces via Ollama
2. Fixing spatial op vocabulary issues
3. Retraining and validating the model
4. Tracking improvements and iterating

Runs continuously with configurable sleep intervals.
"""

import os
import sys
import json
import time
import random
import subprocess
from pathlib import Path
from datetime import datetime
from typing import Dict, List, Tuple, Any
import torch

# Configuration
PROJECT_ROOT = Path("/home/jericho/projects/zion/projects/geometry_os/geometry_os")
SCRIPTS_DIR = PROJECT_ROOT / "scripts"
TRACES_DIR = PROJECT_ROOT / "traces"
SYNTHETIC_DIR = TRACES_DIR / "synthetic"
MODELS_DIR = PROJECT_ROOT / "models"
MODEL_PATH = MODELS_DIR / "syscall_synthesis_model.pt"

TARGET_VCC = 95.0
OBSERVATION_SLEEP = 300  # 5 minutes between iterations
MAJOR_TASK_SLEEP = 1800  # 30 minutes between major retraining

# Ollama configuration
OLLAMA_ASK = Path.home() / "zion" / "bin" / "ollama-ask"
OLLAMA_MODEL = "qwen2.5-coder:14b"


class DaemonLogger:
    """Simple file-based logger with timestamps."""
    def __init__(self, log_file: Path):
        self.log_file = log_file
        log_file.parent.mkdir(parents=True, exist_ok=True)

    def log(self, level: str, message: str):
        timestamp = datetime.now().strftime("%Y-%m-%d %H:%M:%S")
        line = f"[{timestamp}] [{level}] {message}\n"
        self.log_file.open('a').write(line)
        print(line.rstrip())
        self.log_file.open('a').flush()

    def info(self, msg): self.log("INFO", msg)
    def warn(self, msg): self.log("WARN", msg)
    def error(self, msg): self.log("ERROR", msg)
    def success(self, msg): self.log("SUCCESS", msg)


def run_command(cmd: List[str], timeout: int = 300) -> Tuple[int, str, str]:
    """Run shell command with timeout, return exit code, stdout, stderr."""
    try:
        result = subprocess.run(
            cmd,
            capture_output=True,
            text=True,
            timeout=timeout
        )
        return result.returncode, result.stdout, result.stderr
    except subprocess.TimeoutExpired:
        return -1, "", "Command timed out"
    except Exception as e:
        return -1, "", str(e)


def ask_ollama(prompt: str, system: str = "") -> str:
    """Query Ollama model and return response."""
    cmd = [str(OLLAMA_ASK), "-m", OLLAMA_MODEL]

    if system:
        cmd.extend(["-s", system])

    # Write prompt to temp file for large prompts
    temp_file = Path("/tmp/ollama_prompt.txt")
    temp_file.write_text(prompt)
    cmd.extend(["-f", str(temp_file)])

    try:
        code, stdout, stderr = run_command(cmd, timeout=120)
        if code == 0:
            return stdout.strip()
        else:
            return f"ERROR: {stderr}"
    except Exception as e:
        return f"ERROR: {e}"


def get_current_vcc(logger: DaemonLogger) -> Dict[str, float]:
    """Run VCC validation and return results."""
    logger.info("Running VCC validation...")

    cmd = ["python3", str(SCRIPTS_DIR / "vcc_validation_simple.py")]
    code, stdout, stderr = run_command(cmd, timeout=600)

    if code != 0:
        logger.error(f"VCC validation failed: {stderr}")
        logger.error(f"stdout: {stdout[:500]}")
        return {"overall": 0.0}

    # Parse output for accuracy
    lines = stdout.split('\n')
    results = {"overall": 0.0}

    for line in lines:
        if "Overall mapping accuracy" in line:
            try:
                pct = line.split(':')[1].strip()
                results["overall"] = float(pct.replace('%', ''))
            except:
                pass
        elif "Per-syscall accuracy:" in line:
            # Parse the per-syscall table that follows
            continue
        elif line.strip() and line.count(':') >= 1:
            # Try to parse syscall accuracy lines like:  syscall_name  : 95.00% (10 calls)
            try:
                parts = [p.strip() for p in line.split(':')]
                if len(parts) >= 2:
                    name_part = parts[0]
                    # Extract syscall name (first word)
                    syscall_name = name_part.split()[0] if name_part.split() else None

                    # Extract accuracy
                    data_part = parts[1]
                    if '%' in data_part:
                        accuracy_str = data_part.split('%')[0].strip()
                        accuracy = float(accuracy_str)

                        if syscall_name and syscall_name not in ["Per-syscall", "VCC"]:
                            results[syscall_name] = accuracy
            except:
                pass

    logger.info(f"Current VCC: {results.get('overall', 0):.2f}%")
    return results


def generate_synthetic_traces(
    syscall_type: str,
    count: int,
    logger: DaemonLogger
) -> bool:
    """Generate synthetic traces using Ollama."""
    logger.info(f"Generating {count} {syscall_type} traces via Ollama...")

    system_prompt = """You are an expert in RISC-V XV6 system call semantics and Memory Palace spatial operations.
Generate realistic syscall trace data in valid JSON format.
Each syscall entry must have:
- syscall: {name, number}
- arguments: {a0, a1, a2, a3, a4, a5}
- return_value: integer
- semantics: {spatial_ops: [...]}

The spatial_ops must be valid Memory Palace operations like:
allocate_buffer_pixels, free_buffer_pixels, copy_pixels, fill_pixels,
traverse_directory_hilbert_tree, load_inode_pixels, free_inode_pixels,
allocate_pipe_buffer_pixels, etc."""

    # Check if we already have a synthetic file
    existing_file = SYNTHETIC_DIR / f"synthetic_{syscall_type}.json"
    existing_count = 0

    if existing_file.exists():
        try:
            data = json.loads(existing_file.read_text())
            existing_count = len(data.get("syscalls", []))
            logger.info(f"Existing {syscall_type} traces: {existing_count}")
        except:
            pass

    if existing_count >= count:
        logger.info(f"Already have {existing_count} {syscall_type} traces, skipping")
        return True

    needed = count - existing_count

    prompt = f"""Generate {needed} synthetic {syscall_type} syscall traces for XV6 RISC-V.

For {syscall_type}:
- Use realistic argument values (file descriptors, pointers, flags)
- Include proper return values (0 for success, -1 for errors)
- Add appropriate spatial operations for Memory Palace

Return ONLY valid JSON in this format:
{{
  "trace_name": "synthetic_{syscall_type}",
  "syscalls": [
    {{
      "syscall": {{"name": "{syscall_type}", "number": <number>}},
      "arguments": {{"a0": <val>, "a1": <val>, "a2": <val>, "a3": <val>, "a4": <val>, "a5": <val>}},
      "return_value": <val>,
      "semantics": {{"spatial_ops": ["op1", "op2"]}}
    }}
  ]
}}

Do not include any explanation or markdown formatting. Only pure JSON."""

    response = ask_ollama(prompt, system_prompt)

    if "ERROR" in response:
        logger.error(f"Ollama generation failed: {response}")
        return False

    try:
        # Try to parse JSON from response
        data = json.loads(response)

        # If we have existing data, merge
        if existing_file.exists():
            existing_data = json.loads(existing_file.read_text())
            existing_syscalls = existing_data.get("syscalls", [])
            new_syscalls = data.get("syscalls", [])
            data["syscalls"] = existing_syscalls + new_syscalls

        # Save
        existing_file.write_text(json.dumps(data, indent=2))
        total = len(data.get("syscalls", []))
        logger.success(f"Generated {needed} {syscall_type} traces (total: {total})")
        return True

    except json.JSONDecodeError as e:
        logger.error(f"Failed to parse Ollama response: {e}")
        # Save raw response for debugging
        debug_file = SYNTHETIC_DIR / f"synthetic_{syscall_type}_debug.txt"
        debug_file.write_text(response)
        return False


def check_openat_vocabulary(logger: DaemonLogger) -> bool:
    """Check if openat spatial ops need fixing."""
    logger.info("Checking openat spatial op vocabulary...")

    # Look for openat examples in traces
    openat_examples = []

    for trace_dir in [TRACES_DIR / "parsed", SYNTHETIC_DIR]:
        if trace_dir.exists():
            for json_file in trace_dir.glob("*.json"):
                try:
                    data = json.loads(json_file.read_text())
                    for item in data.get("syscalls", []):
                        if item["syscall"]["name"] == "openat":
                            semantics = item.get("semantics", {})
                            openat_examples.append(semantics.get("spatial_ops", []))
                except:
                    pass

    if not openat_examples:
        logger.warn("No openat examples found in traces")
        return False

    # Check spatial ops
    logger.info(f"Found {len(openat_examples)} openat examples")

    # Check if we have the right ops
    expected_ops = ["traverse_directory_hilbert_tree", "load_inode_pixels"]
    has_correct_ops = any(
        all(op in example for op in expected_ops)
        for example in openat_examples
    )

    if has_correct_ops:
        logger.info("openat spatial ops look correct")
        return True
    else:
        logger.warn("openat spatial ops may need fixing")
        # Log what we found
        unique_ops = set()
        for example in openat_examples:
            unique_ops.update(example)
        logger.info(f"Current openat ops: {sorted(unique_ops)}")
        return False


def fix_openat_traces(logger: DaemonLogger) -> bool:
    """Generate correct openat traces with proper spatial ops."""
    logger.info("Generating corrected openat traces...")

    system_prompt = """You are an expert in RISC-V XV6 openat syscall semantics and Memory Palace spatial operations.
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
{{
  "trace_name": "synthetic_openat",
  "syscalls": [
    {{
      "syscall": {{"name": "openat", "number": 56}},
      "arguments": {{"a0": -100, "a1": <path_ptr>, "a2": <flags>, "a3": <mode>, "a4": 0, "a5": 0}},
      "return_value": <fd>,
      "semantics": {{"spatial_ops": ["traverse_directory_hilbert_tree", "load_inode_pixels"]}}
    }}
  ]
}}

Do not include any explanation or markdown formatting. Only pure JSON."""

    response = ask_ollama(prompt, system_prompt)

    if "ERROR" in response:
        logger.error(f"Ollama generation failed: {response}")
        return False

    try:
        data = json.loads(response)

        # Save to synthetic directory
        output_file = SYNTHETIC_DIR / "synthetic_openat.json"
        output_file.write_text(json.dumps(data, indent=2))

        logger.success(f"Generated corrected openat traces with {len(data.get('syscalls', []))} examples")
        return True

    except json.JSONDecodeError as e:
        logger.error(f"Failed to parse Ollama response: {e}")
        return False


def retrain_model(logger: DaemonLogger) -> bool:
    """Retrain the syscall synthesis model."""
    logger.info("Retraining model with updated traces...")

    cmd = ["python3", str(SCRIPTS_DIR / "train_syscall_synthesis.py")]
    code, stdout, stderr = run_command(cmd, timeout=1800)  # 30 min timeout

    if code == 0:
        logger.success("Model retrained successfully")
        # Log training accuracy
        for line in stdout.split('\n'):
            if "Epoch" in line and "Accuracy" in line:
                logger.info(line)
        return True
    else:
        logger.error(f"Model training failed: {stderr}")
        return False


def generate_diverse_examples(
    syscall_types: List[str],
    logger: DaemonLogger
) -> bool:
    """Generate diverse examples for specified syscalls."""
    all_success = True

    for syscall_type in syscall_types:
        # Count current examples
        current_count = 0
        trace_file = SYNTHETIC_DIR / f"synthetic_{syscall_type}.json"

        if trace_file.exists():
            try:
                data = json.loads(trace_file.read_text())
                current_count = len(data.get("syscalls", []))
            except:
                pass

        # We want at least 40 examples total (20 + 20 diverse)
        target = 40
        needed = max(0, target - current_count)

        if needed > 0:
            logger.info(f"Need {needed} more {syscall_type} examples (have {current_count})")

            # Generate diverse examples
            system_prompt = f"""You are an expert in RISC-V XV6 {syscall_type} syscall semantics.
Generate diverse, realistic examples with different:
- Argument values (valid and edge cases)
- Return values (success and error cases)
- Spatial operation combinations

For {syscall_type}, use appropriate Memory Palace spatial ops."""

            prompt = f"""Generate {needed} diverse {syscall_type} syscall traces.

Vary the patterns:
- Different argument ranges
- Different return values (0, positive, -1, error codes)
- Different spatial op sequences

Return ONLY valid JSON:
{{
  "trace_name": "synthetic_{syscall_type}_diverse",
  "syscalls": [
    {{
      "syscall": {{"name": "{syscall_type}", "number": <number>}},
      "arguments": {{"a0": <val>, "a1": <val>, "a2": <val>, "a3": <val>, "a4": <val>, "a5": <val>}},
      "return_value": <val>,
      "semantics": {{"spatial_ops": ["op1", "op2"]}}
    }}
  ]
}}

Pure JSON only. No explanation."""

            response = ask_ollama(prompt, system_prompt)

            if "ERROR" not in response:
                try:
                    new_data = json.loads(response)
                    new_syscalls = new_data.get("syscalls", [])

                    if new_syscalls:
                        # Merge with existing
                        existing_data = {"syscalls": []}
                        if trace_file.exists():
                            existing_data = json.loads(trace_file.read_text())

                        existing_data["syscalls"].extend(new_syscalls)
                        trace_file.write_text(json.dumps(existing_data, indent=2))

                        logger.success(f"Added {len(new_syscalls)} {syscall_type} examples (total: {len(existing_data['syscalls'])})")
                    else:
                        logger.warn(f"No {syscall_type} examples generated")
                        all_success = False

                except json.JSONDecodeError:
                    logger.error(f"Failed to parse {syscall_type} response")
                    all_success = False
            else:
                logger.error(f"Ollama failed for {syscall_type}: {response}")
                all_success = False
        else:
            logger.info(f"Already have enough {syscall_type} examples ({current_count})")

    return all_success


def daemon_main():
    """Main daemon loop."""
    # Setup logging
    log_file = PROJECT_ROOT / "logs" / "daemon" / f"syscall_improver_{datetime.now().strftime('%Y%m%d')}.log"
    logger = DaemonLogger(log_file)

    logger.info("=" * 70)
    logger.info("Starting Ollama Syscall Synthesis Improver Daemon")
    logger.info("=" * 70)

    iteration = 0

    while True:
        iteration += 1
        logger.info(f"\n{'=' * 70}")
        logger.info(f"Iteration {iteration}")
        logger.info(f"{'=' * 70}")

        try:
            # Step 1: Check current VCC
            vcc_results = get_current_vcc(logger)
            current_vcc = vcc_results.get("overall", 0.0)

            # Step 2: Check if we've hit target
            if current_vcc >= TARGET_VCC:
                logger.success(f"Target VCC ({TARGET_VCC}%) achieved! Current: {current_vcc:.2f}%")
                logger.info("Entering maintenance mode...")

                # Maintenance mode: just monitor every 30 minutes
                time.sleep(MAJOR_TASK_SLEEP)
                continue

            # Step 3: Identify what needs fixing
            logger.info("Identifying improvement targets...")

            needs_fix = []
            for syscall, accuracy in vcc_results.items():
                if syscall == "overall":
                    continue
                if accuracy < 70.0:
                    needs_fix.append(syscall)
                    logger.warn(f"{syscall}: {accuracy:.1f}% - needs work")

            if not needs_fix:
                logger.info("No critical failures found. Generating diverse examples...")

                # Generate more examples for borderline syscalls
                borderline = []
                for syscall, accuracy in vcc_results.items():
                    if syscall == "overall":
                        continue
                    if 70.0 <= accuracy < 90.0:
                        borderline.append(syscall)

                if borderline:
                    generate_diverse_examples(borderline, logger)

            # Step 4: Fix openat specifically (regression)
            if "openat" in vcc_results and vcc_results["openat"] == 0.0:
                logger.warn("openat regression detected (0% accuracy)")
                if check_openat_vocabulary(logger):
                    logger.info("openat vocabulary looks OK, skipping")
                else:
                    logger.info("Fixing openat spatial ops...")
                    fix_openat_traces(logger)

            # Step 5: Generate synthetic traces for failing syscalls
            for syscall in needs_fix:
                # Count current examples
                current_count = 0
                trace_file = SYNTHETIC_DIR / f"synthetic_{syscall}.json"
                if trace_file.exists():
                    try:
                        data = json.loads(trace_file.read_text())
                        current_count = len(data.get("syscalls", []))
                    except:
                        pass

                # Need at least 40 examples
                if current_count < 40:
                    logger.info(f"Generating synthetic traces for {syscall}...")
                    generate_synthetic_traces(syscall, 40, logger)

            # Step 6: Retrain model if we made changes
            logger.info("Checking if retraining is needed...")

            # Simple heuristic: if we've done any work, retrain
            if needs_fix or "openat" in vcc_results:
                logger.info("Changes made, retraining model...")
                retrain_success = retrain_model(logger)

                if retrain_success:
                    # Step 7: Validate new model
                    new_vcc_results = get_current_vcc(logger)
                    new_vcc = new_vcc_results.get("overall", 0.0)

                    improvement = new_vcc - current_vcc
                    logger.info(f"VCC change: {current_vcc:.2f}% → {new_vcc:.2f}% ({improvement:+.2f}%)")

                    if improvement > 0:
                        logger.success(f"Improvement achieved: +{improvement:.2f}%")
                    else:
                        logger.warn(f"No improvement (or regression): {improvement:.2f}%")
                else:
                    logger.error("Retraining failed, skipping validation")
            else:
                logger.info("No changes needed, skipping retraining")

        except KeyboardInterrupt:
            logger.info("\nDaemon stopped by user")
            break
        except Exception as e:
            logger.error(f"Iteration failed: {e}")
            import traceback
            traceback.print_exc()

        # Sleep before next iteration
        logger.info(f"Sleeping for {OBSERVATION_SLEEP}s before next iteration...")
        time.sleep(OBSERVATION_SLEEP)

    logger.info("Daemon shutdown complete")


if __name__ == "__main__":
    daemon_main()