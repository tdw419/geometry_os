#!/usr/bin/env python3
"""Actuator — Layer 3 of the recursive self-improvement loop.

Reads the latest Process Improvement Proposal (PIP), invokes the LLM via
model_choice to determine the necessary file modification, and applies it safely
using the keep-or-revert skill.

Usage:
    python3 scripts/actuator.py
"""
import json
import sys
import subprocess
import os
import re
from pathlib import Path

WORKDIR = Path(__file__).resolve().parent.parent
PIP_DIR = WORKDIR / ".autodev" / "pips"
KEEP_OR_REVERT = Path.home() / ".hermes" / "skills" / "keep-or-revert" / "scripts" / "keep_or_revert.py"

try:
    sys.path.insert(0, str(WORKDIR))
    from model_choice import generate
except ImportError:
    generate = None

def get_latest_pip():
    if not PIP_DIR.exists():
        return None
    # Only match unprocessed PIPs (not .done or .failed)
    pips = sorted(PIP_DIR.glob("pip_*.json"))
    return pips[-1] if pips else None

def extract_json(text):
    m = re.search(r'```json\s*(\{.*?\})\s*```', text, re.DOTALL)
    if m:
        try:
            return json.loads(m.group(1))
        except:
            pass
    try:
        return json.loads(text)
    except:
        return None

def main():
    print("=== GEOMETRY OS ACTUATOR ===")
    pip_file = get_latest_pip()
    if not pip_file:
        print("No PIP found.")
        return

    pip_data = json.loads(pip_file.read_text())
    prompt = pip_data.get("evaluator_prompt")
    if not prompt:
        print("No evaluator_prompt found in latest PIP.")
        return

    print(f"Reading PIP: {pip_file.name}")
    print("Consulting LLM for process improvement (this may take a moment)...")

    if not generate:
        print("[ERROR] model_choice not available. Cannot invoke LLM.")
        print("This script requires model_choice with a working provider.")
        return

    try:
        response = generate(prompt)
    except Exception as e:
        print(f"\n[ERROR] LLM Generation failed: {e}")
        return
    proposal = extract_json(response)

    if not proposal:
        print("Failed to parse JSON proposal from LLM.")
        print("Raw response:")
        print(response)
        return

    action = proposal.get("action")
    if action == "none":
        print("LLM deemed no action necessary.")
        return

    apply_cmd = proposal.get("apply_cmd")
    validate_cmd = proposal.get("validate_cmd", "cargo check")
    description = proposal.get("description", "No description")
    target = proposal.get("target", "unknown")

    if not apply_cmd:
        print(f"Invalid proposal format (missing apply_cmd): {proposal}")
        return

    print("\n--- IMPROVEMENT PROPOSAL ---")
    print(f"Target: {target}")
    print(f"Description: {description}")
    print(f"Risk: {proposal.get('risk', 'unknown')}")
    print(f"Apply Cmd: {apply_cmd}")
    print(f"Validate Cmd: {validate_cmd}")
    print("----------------------------\n")

    # Safety: refuse high-risk changes without --force
    risk = proposal.get("risk", "unknown")
    force = "--force" in sys.argv
    if risk == "high" and not force:
        print(f"[BLOCKED] High-risk proposal. Use --force to apply.")
        return

    print("Applying change via keep-or-revert...")
    
    keep_revert_cmd = [
        "python3", str(KEEP_OR_REVERT),
        "--repo", str(WORKDIR),
        "--test-cmd", validate_cmd,
        "--commit-message", f"Auto-tune: {description}",
        "bash", "-c", apply_cmd
    ]
    
    # We should let the user see the output directly if we are running manually, 
    # but subprocess.run without capture_output connects it to current stdout/stderr.
    r = subprocess.run(keep_revert_cmd, cwd=WORKDIR)
    if r.returncode == 0:
        print("\n[SUCCESS] Improvement applied and validated.")
        # Mark PIP as processed so it doesn't run again if actuator runs on a schedule
        processed_path = pip_file.with_suffix(".json.done")
        pip_file.rename(processed_path)
    else:
        print(f"\n[FAILED] Improvement failed or validation failed (code {r.returncode}). System reverted.")
        # We can rename to .failed
        failed_path = pip_file.with_suffix(".json.failed")
        pip_file.rename(failed_path)

if __name__ == "__main__":
    main()
