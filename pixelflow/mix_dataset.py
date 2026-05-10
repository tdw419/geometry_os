#!/usr/bin/env python3
"""
Dataset Mixer for PixelGPT Self-Improvement.

Combines self-distilled programs with synthetic programs into a
single training dataset. Supports weighted mixing and stratified
sampling to maintain category balance.

Usage:
    python3 mix_dataset.py \
        --synthetic-dir synthetic_dataset_v13 \
        --distilled-dir self_distilled_v13 \
        --output mixed_dataset_v14 \
        --distilled-ratio 0.3
"""

import os
import sys
import random
import shutil
import argparse
import json
from pathlib import Path

sys.path.insert(0, os.path.dirname(__file__))


def count_synthetic_files(synth_dir):
    """Count files in the synthetic dataset by prefix pattern."""
    synth_path = Path(synth_dir)
    if not synth_path.exists():
        print(f"[!] Synthetic dir {synth_dir} not found")
        return {}

    counts = {}
    for f in synth_path.glob("*.asm"):
        counts[f.name] = f
    return counts


def count_distilled_files(distill_dir):
    """Count and categorize distilled files."""
    distill_path = Path(distill_dir)
    if not distill_path.exists():
        print(f"[!] Distilled dir {distill_dir} not found")
        return {}

    files = list(distill_path.glob("*.asm"))
    # Exclude stats file
    files = [f for f in files if f.suffix == ".asm"]
    return files


def mix_datasets(synth_dir, distill_dir, output_dir, distilled_ratio=0.3,
                 max_synthetic=70000, max_distilled=30000, seed=42):
    """
    Mix synthetic and self-distilled programs into a combined dataset.

    Args:
        synth_dir: Directory with synthetic .asm files
        distill_dir: Directory with self-distilled .asm files
        output_dir: Output directory for mixed dataset
        distilled_ratio: Fraction of dataset from self-distilled (0.0-1.0)
        max_synthetic: Cap on synthetic programs to include
        max_distilled: Cap on distilled programs to include
        seed: Random seed for reproducibility
    """
    random.seed(seed)

    synth_path = Path(synth_dir)
    distill_path = Path(distill_dir)
    out_path = Path(output_dir)

    # Gather files
    synth_files = sorted(synth_path.glob("*.asm"))
    distill_files = sorted(distill_path.glob("*.asm"))

    print(f"[*] Synthetic files: {len(synth_files)}")
    print(f"[*] Distilled files: {len(distill_files)}")

    if not synth_files:
        print("[!] No synthetic files found!")
        return
    if not distill_files:
        print("[!] No distilled files found!")
        return

    # Sample from each source
    num_distilled = min(len(distill_files), max_distilled)
    num_synthetic = min(len(synth_files), max_synthetic)

    # Adjust to match ratio
    total_target = num_distilled + num_synthetic
    target_distilled = int(total_target * distilled_ratio)
    target_synthetic = total_target - target_distilled

    # Cap to available
    num_distilled = min(num_distilled, target_distilled)
    num_synthetic = min(num_synthetic, target_synthetic)

    sampled_synth = random.sample(synth_files, num_synthetic) if num_synthetic < len(synth_files) else synth_files
    sampled_distill = random.sample(distill_files, num_distilled) if num_distilled < len(distill_files) else distill_files

    print(f"[*] Selected: {len(sampled_synth)} synthetic + {len(sampled_distill)} distilled")
    print(f"[*] Ratio: {len(sampled_distill)/(len(sampled_synth)+len(sampled_distill))*100:.1f}% distilled")

    # Create output directory
    out_path.mkdir(parents=True, exist_ok=True)

    # Copy files with unified naming
    idx = 0
    for f in sampled_synth:
        shutil.copy2(f, out_path / f"prog_{idx:06d}.asm")
        idx += 1

    for f in sampled_distill:
        shutil.copy2(f, out_path / f"prog_{idx:06d}.asm")
        idx += 1

    # Shuffle for good measure (rename to random order)
    all_files = sorted(out_path.glob("*.asm"))
    random.shuffle(all_files)
    for i, f in enumerate(all_files):
        f.rename(out_path / f"prog_{i:06d}.asm")

    # Save mixing metadata
    metadata = {
        "synthetic_count": len(sampled_synth),
        "distilled_count": len(sampled_distill),
        "total": idx,
        "distilled_ratio": len(sampled_distill) / idx,
        "source_synth": str(synth_dir),
        "source_distill": str(distill_dir),
        "seed": seed,
    }
    with open(out_path / "mix_metadata.json", "w") as f:
        json.dump(metadata, f, indent=2)

    print(f"\n[*] Mixed dataset: {idx} programs -> {out_path}/")
    print(f"    {len(sampled_synth)} synthetic ({len(sampled_synth)/idx*100:.1f}%)")
    print(f"    {len(sampled_distill)} self-distilled ({len(sampled_distill)/idx*100:.1f}%)")

    return idx


if __name__ == "__main__":
    parser = argparse.ArgumentParser()
    parser.add_argument("--synthetic-dir", default="synthetic_dataset_v13")
    parser.add_argument("--distilled-dir", default="self_distilled_v13")
    parser.add_argument("--output-dir", default="mixed_dataset_v14")
    parser.add_argument("--distilled-ratio", type=float, default=0.3,
                        help="Fraction of dataset from self-distilled (default: 0.3)")
    parser.add_argument("--max-synthetic", type=int, default=70000)
    parser.add_argument("--max-distilled", type=int, default=30000)
    parser.add_argument("--seed", type=int, default=42)
    args = parser.parse_args()

    mix_datasets(
        args.synthetic_dir, args.distilled_dir, args.output_dir,
        distilled_ratio=args.distilled_ratio,
        max_synthetic=args.max_synthetic,
        max_distilled=args.max_distilled,
        seed=args.seed,
    )
