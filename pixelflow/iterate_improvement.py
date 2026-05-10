#!/usr/bin/env python3
"""
PixelGPT Iterative Self-Improvement Orchestrator.

Runs the full recursive self-improvement loop:
  1. Self-distill from current checkpoint
  2. Mix distilled data with synthetic data
  3. Build dataset
  4. Train next version
  5. Evaluate and compare

Usage:
    python3 iterate_improvement.py --start-version 13 --max-versions 16

This runs V13 -> V14 -> V15 -> V16 automatically.
"""

import os
import sys
import subprocess
import json
import argparse
import time
from pathlib import Path

sys.path.insert(0, os.path.dirname(__file__))

PIXELFLOW_DIR = Path(__file__).parent
PROJECT_DIR = PIXELFLOW_DIR.parent


def run_step(name, cmd, cwd=None):
    """Run a subprocess step and return success."""
    if cwd is None:
        cwd = PROJECT_DIR
    print(f"\n{'='*60}")
    print(f"  STEP: {name}")
    print(f"  CMD:  {' '.join(cmd)}")
    print(f"{'='*60}")
    result = subprocess.run(cmd, cwd=cwd, capture_output=False)
    if result.returncode != 0:
        print(f"[!] {name} failed with exit code {result.returncode}")
        return False
    print(f"[+] {name} completed successfully")
    return True


def run_smoke_test(checkpoint, version):
    """Run smoke test and return scores."""
    print(f"\n[*] Running smoke test for V{version}...")
    cmd = [
        sys.executable, str(PIXELFLOW_DIR / "smoke_test.py"),
        "--checkpoint", str(checkpoint),
    ]
    result = subprocess.run(cmd, cwd=PROJECT_DIR, capture_output=True, text=True)
    output = result.stdout

    # Parse scores
    scores = {"syntax": 0, "visual": 0, "semantic": 0}
    for line in output.split('\n'):
        if "Syntax:" in line:
            scores["syntax"] = int(line.split(":")[1].strip().split("/")[0])
        elif "Visual:" in line:
            scores["visual"] = int(line.split(":")[1].strip().split("/")[0])
        elif "Semantic:" in line:
            scores["semantic"] = int(line.split(":")[1].strip().split("/")[0])

    total = scores["syntax"] + scores["visual"] + scores["semantic"]
    print(f"[*] V{version} Scores: Syntax={scores['syntax']}/10  Visual={scores['visual']}/10  Semantic={scores['semantic']}/10  Total={total}/30")
    return scores


def run_iteration(version, prev_checkpoint, num_distill=10000, distilled_ratio=0.3,
                  train_epochs=10):
    """
    Run one iteration of self-improvement.

    Args:
        version: Current version number (e.g., 14)
        prev_checkpoint: Path to previous version's checkpoint
        num_distill: Number of programs to generate via self-distillation
        distilled_ratio: Fraction of mixed dataset from self-distilled
        train_epochs: Number of training epochs

    Returns:
        (checkpoint_path, scores) or (None, None) on failure
    """
    prev_version = version - 1
    checkpoint_name = f"bilingual_llm_v{version}_ckpt.pt"
    checkpoint_path = PIXELFLOW_DIR / checkpoint_name

    # Step 1: Self-distill
    distill_dir = PIXELFLOW_DIR / f"self_distilled_v{prev_version}"
    print(f"\n{'#'*60}")
    print(f"  ITERATION: V{prev_version} -> V{version}")
    print(f"{'#'*60}")

    if not run_step(
        f"Self-Distill from V{prev_version}",
        [sys.executable, str(PIXELFLOW_DIR / "self_distill.py"),
         "--checkpoint", str(prev_checkpoint),
         "--output-dir", str(distill_dir),
         "--num-samples", str(num_distill)]
    ):
        return None, None

    # Step 2: Mix datasets
    mixed_dir = PIXELFLOW_DIR / f"mixed_dataset_v{version}"
    if not run_step(
        f"Mix Datasets for V{version}",
        [sys.executable, str(PIXELFLOW_DIR / "mix_dataset.py"),
         "--synthetic-dir", str(PIXELFLOW_DIR / "synthetic_dataset_v13"),
         "--distilled-dir", str(distill_dir),
         "--output-dir", str(mixed_dir),
         "--distilled-ratio", str(distilled_ratio)]
    ):
        return None, None

    # Step 3: Build NPZ
    npz_name = f"bilingual_dataset_v{version}.npz"
    if not run_step(
        f"Build NPZ for V{version}",
        [sys.executable, str(PIXELFLOW_DIR / "build_bilingual_dataset.py"),
         "--data-dir", str(mixed_dir),
         "--tokenizer", str(PIXELFLOW_DIR / "bilingual_tokenizer_v4"),
         "--output", str(PIXELFLOW_DIR / npz_name)]
    ):
        return None, None

    # Step 4: Train
    if not run_step(
        f"Train V{version} ({train_epochs} epochs)",
        [sys.executable, str(PIXELFLOW_DIR / "train_bilingual_llm.py"),
         "--dataset", str(PIXELFLOW_DIR / npz_name),
         "--tokenizer", str(PIXELFLOW_DIR / "bilingual_tokenizer_v4"),
         "--checkpoint", str(checkpoint_path),
         "--epochs", str(train_epochs),
         "--lr", "1e-4"]  # Lower LR for fine-tuning on mixed data
    ):
        return None, None

    # Step 5: Evaluate
    scores = run_smoke_test(checkpoint_path, version)

    return checkpoint_path, scores


def main():
    parser = argparse.ArgumentParser(description="PixelGPT Iterative Self-Improvement")
    parser.add_argument("--start-version", type=int, default=13,
                        help="Starting version (checkpoint must exist)")
    parser.add_argument("--max-versions", type=int, default=16,
                        help="Stop after reaching this version")
    parser.add_argument("--num-distill", type=int, default=10000,
                        help="Programs to generate per iteration")
    parser.add_argument("--distilled-ratio", type=float, default=0.3,
                        help="Fraction of mixed dataset from self-distilled")
    parser.add_argument("--train-epochs", type=int, default=10,
                        help="Training epochs per iteration")
    args = parser.parse_args()

    # Check starting checkpoint exists
    start_ckpt = PIXELFLOW_DIR / f"bilingual_llm_v{args.start_version}_ckpt.pt"
    if not start_ckpt.exists():
        print(f"[!] Starting checkpoint not found: {start_ckpt}")
        print(f"[!] Run training first to create V{args.start_version}")
        return

    # Run baseline evaluation
    baseline_scores = run_smoke_test(start_ckpt, args.start_version)
    baseline_total = sum(baseline_scores.values())

    # Iterative improvement loop
    checkpoint = start_ckpt
    history = {args.start_version: {"scores": baseline_scores, "total": baseline_total}}

    t0 = time.time()

    for version in range(args.start_version + 1, args.max_versions + 1):
        checkpoint, scores = run_iteration(
            version, checkpoint,
            num_distill=args.num_distill,
            distilled_ratio=args.distilled_ratio,
            train_epochs=args.train_epochs,
        )

        if checkpoint is None:
            print(f"\n[!] Iteration V{version-1} -> V{version} failed. Stopping.")
            break

        total = sum(scores.values())
        history[version] = {"scores": scores, "total": total}

        # Print progress
        print(f"\n{'='*60}")
        print(f"  PROGRESS REPORT")
        print(f"{'='*60}")
        for v, data in history.items():
            delta = ""
            if v > args.start_version:
                prev_total = history[v-1]["total"]
                diff = data["total"] - prev_total
                delta = f" ({diff:+d})"
            s = data["scores"]
            print(f"  V{v}: S={s['syntax']}/10 V={s['visual']}/10 P={s['semantic']}/10 = {data['total']}/30{delta}")

    elapsed = time.time() - t0
    print(f"\n{'='*60}")
    print(f"  SELF-IMPROVEMENT COMPLETE")
    print(f"  Baseline:  V{args.start_version} = {baseline_total}/30")
    if len(history) > 1:
        final_version = max(history.keys())
        final_total = history[final_version]["total"]
        improvement = final_total - baseline_total
        print(f"  Final:     V{final_version} = {final_total}/30 ({improvement:+d})")
        print(f"  Time:      {elapsed/60:.1f} minutes")
    print(f"{'='*60}")

    # Save history
    history_path = PIXELFLOW_DIR / "improvement_history.json"
    with open(history_path, "w") as f:
        json.dump(history, f, indent=2)
    print(f"[*] History saved to {history_path}")


if __name__ == "__main__":
    main()
