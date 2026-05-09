#!/usr/bin/env python3
"""Improvement Loop Dashboard — run observe/evaluate/act cycle manually.

Usage:
    python3 scripts/improvement_dashboard.py          # observe + evaluate
    python3 scripts/improvement_dashboard.py --act    # observe + evaluate + act (needs LLM)
"""
import json
import subprocess
import sys
from pathlib import Path

WORKDIR = Path(__file__).resolve().parent.parent
METRICS_LOG = WORKDIR / ".autodev" / "metrics_history.jsonl"
PIP_DIR = WORKDIR / ".autodev" / "pips"
KEEP_OR_REVERT = Path.home() / ".hermes" / "skills" / "keep-or-revert" / "scripts" / "keep_or_revert.py"


def run(cmd, **kwargs):
    return subprocess.run(cmd, shell=True, capture_output=True, text=True, cwd=WORKDIR, **kwargs)


def main():
    act = "--act" in sys.argv

    print("=== GEOMETRY OS SELF-IMPROVEMENT DASHBOARD ===\n")

    # 1. OBSERVE
    print("[1/3] Observing system state...")
    r = run("python3 scripts/collect_metrics.py")
    print(r.stdout)

    # 2. EVALUATE
    print("[2/3] Evaluating bottlenecks...")
    r = run("python3 scripts/evaluate_metrics.py --auto-apply")
    print(r.stdout)

    # 3. Check for PIPs
    if not PIP_DIR.exists():
        print("No PIPs generated. System healthy.")
        return

    pips = sorted(PIP_DIR.glob("pip_*.json"))
    if not pips:
        print("No PIPs generated. System healthy.")
        return

    latest_pip = pips[-1]
    pip_data = json.loads(latest_pip.read_text())

    # Check if there's an actionable bottleneck
    bottlenecks = pip_data.get("bottlenecks", [])
    has_action = any(b.get("severity") != "none" for b in bottlenecks)

    if not has_action:
        print("[3/3] No action needed — system healthy.")
        return

    print(f"[3/3] LATEST PIP: {latest_pip.name}")
    print(f"  Bottlenecks: {len([b for b in bottlenecks if b['severity'] != 'none'])}")
    for b in bottlenecks:
        if b["severity"] != "none":
            print(f"  - [{b['severity']}] {b['signal']}")
            if b.get("target"):
                print(f"    Target: {b['target']}")

    if not act:
        print(f"\nEvaluator prompt saved in PIP.")
        print(f"\nRe-run with --act to invoke the Actuator (LLM generation + keep-or-revert).")
        return

    # 4. ACT
    print("\n[4/4] Actuating (Consulting LLM and Applying)...")
    act_res = run("python3 scripts/actuator.py")
    print(act_res.stdout)
    if act_res.stderr:
        print(act_res.stderr)


if __name__ == "__main__":
    main()
