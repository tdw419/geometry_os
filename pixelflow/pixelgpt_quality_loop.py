#!/usr/bin/env python3
"""
PixelGPT Quality Meta-Loop.
Orchestrates Observe -> Evaluate -> Act phases.
"""
import subprocess
import time
import sys
from pathlib import Path

CHECKPOINT = "pixelflow/bilingual_llm_v13_ckpt.pt"
METRICS_DIR = Path("pixelflow/smoke_results")

def run_phase(name, command):
    print(f"\n{'='*20} PHASE: {name} {'='*20}")
    try:
        subprocess.run(command, check=True)
        return True
    except subprocess.CalledProcessError as e:
        print(f"[!] Phase {name} failed: {e}")
        return False

def main():
    # 1. OBSERVE
    if not run_phase("OBSERVE", ["python3", "pixelflow/smoke_test.py", "--checkpoint", CHECKPOINT]):
        sys.exit(1)

    # 2. EVALUATE
    if not run_phase("EVALUATE", ["python3", "pixelflow/evaluate_quality.py"]):
        sys.exit(1)

    # 3. ACT
    if not run_phase("ACT", ["python3", "pixelflow/actuator.py"]):
        sys.exit(1)

    print(f"\n{'='*20} META-LOOP COMPLETE {'='*20}")
    print("[*] Model quality monitored. Curriculum updated if necessary.")

if __name__ == "__main__":
    main()
