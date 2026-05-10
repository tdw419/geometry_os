#!/usr/bin/env python3
"""
PixelGPT V16 Automated Pipeline.

Waits for V15 training to finish, then runs the full V16 pipeline:
  1. Smoke test V15 to get baseline score
  2. Self-distill V15 with hard-bias toward gradient/loop/multi (3x oversample)
  3. Mix distilled + synthetic at 35% distilled ratio
  4. Build tokenized dataset
  5. Train V16 with train_v2 (eval-guided early stopping, warmup+cosine, EMA)
  6. Smoke test V16 and compare with V15

Usage:
    python3 pixelflow/auto_v16.py            # runs immediately if V15 done
    python3 pixelflow/auto_v16.py --wait     # poll for V15 completion
"""

import json
import os
import shutil
import subprocess
import sys
import time
from pathlib import Path

PROJECT = Path(__file__).resolve().parent.parent
PIXELFLOW = PROJECT / "pixelflow"
TOKENIZER = PIXELFLOW / "bilingual_tokenizer_v4"
V15_CKPT = PIXELFLOW / "bilingual_llm_v15_ckpt.pt"
V16_CKPT = PIXELFLOW / "bilingual_llm_v16_ckpt.pt"
V16_EMA_CKPT = PIXELFLOW / "bilingual_llm_v16_ema.pt"
V15_DISTILL_DIR = PIXELFLOW / "self_distilled_v15"
MIXED_DIR = PIXELFLOW / "mixed_dataset_v16"
V16_DATASET = PIXELFLOW / "bilingual_dataset_v16.npz"
V15_RESULTS = PIXELFLOW / "smoke_v15_results"
V16_RESULTS = PIXELFLOW / "smoke_v16_results"

PYTHON = sys.executable


def run(cmd, cwd=None, check=True, timeout=None):
    """Run a command, stream output, return (returncode, output)."""
    cwd = cwd or PROJECT
    print(f"\n{'='*60}")
    print(f"$ {cmd}")
    print(f"{'='*60}")
    result = subprocess.run(
        cmd, shell=True, cwd=cwd, capture_output=False,
        text=True, timeout=timeout,
    )
    if check and result.returncode != 0:
        print(f"[!] Command failed with exit code {result.returncode}")
        # Don't abort -- report and continue
    return result.returncode


def wait_for_v15(poll_interval=30):
    """Poll for V15 training to complete (check if epoch == 10)."""
    print(f"[*] Waiting for V15 training to complete...")
    print(f"    Checking {V15_CKPT} every {poll_interval}s")
    while True:
        try:
            import torch
            ckpt = torch.load(str(V15_CKPT), map_location='cpu', weights_only=False)
            epoch = ckpt.get('epoch', 0)
            loss = ckpt.get('loss', 0)
            print(f"    V15 at epoch {epoch}/10, loss={loss:.4f}")
            if epoch >= 10:
                print(f"[+] V15 training complete! epoch={epoch}, loss={loss:.4f}")
                return
        except Exception as e:
            print(f"    Checkpoint read error: {e}")
        time.sleep(poll_interval)


def smoke_test(checkpoint, output_dir, label=""):
    """Run smoke test and return metrics dict."""
    run(
        f"{PYTHON} pixelflow/smoke_test.py "
        f"--checkpoint {checkpoint} "
        f"--tokenizer {TOKENIZER} "
        f"--output-dir {output_dir}"
    )
    metrics_path = Path(output_dir) / "metrics.json"
    if metrics_path.exists():
        with open(metrics_path) as f:
            return json.load(f)
    return None


def self_distill_v15():
    """Run self-distillation with hard-bias toward weak categories."""
    # Clean previous run
    if V15_DISTILL_DIR.exists():
        shutil.rmtree(V15_DISTILL_DIR)

    run(
        f"{PYTHON} pixelflow/self_distill.py "
        f"--checkpoint {V15_CKPT} "
        f"--tokenizer {TOKENIZER} "
        f"--output-dir {V15_DISTILL_DIR} "
        f"--num-samples 12000 "
        f"--temperature 0.7 "
        f"--top-k 40 "
        f"--max-tokens 300 "
        f"--hard-bias gradient loop multi "
        f"--hard-bias-weight 3.0"
    )

    stats_path = V15_DISTILL_DIR / "distill_stats.json"
    if stats_path.exists():
        with open(stats_path) as f:
            stats = json.load(f)
        print(f"\n[+] Distillation complete: {stats['valid']}/{stats['total']} valid ({stats['accept_rate']:.1f}%)")
        for cat, count in sorted(stats['categories'].items(), key=lambda x: -x[1]):
            print(f"    {cat}: {count}")
        return stats
    return None


def mix_v16_dataset():
    """Mix synthetic + distilled at 35% ratio."""
    if MIXED_DIR.exists():
        shutil.rmtree(MIXED_DIR)

    # Synthetic .asm dir is at project root, not inside pixelflow/
    synth_dir = PROJECT / "synthetic_dataset_v13"
    if not synth_dir.exists():
        print(f"[!] Synthetic dataset not found at {synth_dir}")
        return 0

    run(
        f"{PYTHON} pixelflow/mix_dataset.py "
        f"--synthetic-dir {synth_dir} "
        f"--distilled-dir {V15_DISTILL_DIR} "
        f"--output-dir {MIXED_DIR} "
        f"--distilled-ratio 0.10 "
        f"--max-synthetic 70000 "
        f"--max-distilled 35000"
    )

    asm_count = len(list(MIXED_DIR.glob("*.asm")))
    print(f"[+] Mixed dataset: {asm_count} programs")
    return asm_count


def build_dataset():
    """Tokenize the mixed dataset into .npz."""
    if V16_DATASET.exists():
        V16_DATASET.unlink()

    run(
        f"{PYTHON} pixelflow/build_bilingual_dataset.py "
        f"--data-dir {MIXED_DIR} "
        f"--tokenizer {TOKENIZER} "
        f"--output {V16_DATASET} "
        f"--context-len 1024 "
        f"--stride 512"
    )

    import numpy as np
    data = np.load(str(V16_DATASET))
    print(f"[+] Tokenized dataset: {len(data['tokens'])} samples")
    return len(data['tokens'])


def train_v16():
    """Train V16 using the improved train_v2 with eval-guided early stopping."""
    rc = run(
        f"{PYTHON} pixelflow/train_v2.py "
        f"--dataset {V16_DATASET} "
        f"--tokenizer {TOKENIZER} "
        f"--checkpoint {V16_CKPT} "
        f"--from-checkpoint {V15_CKPT} "
        f"--epochs 8 "
        f"--batch-size 16 "
        f"--lr 5e-5 "
        f"--warmup-ratio 0.1 "
        f"--dropout 0.1",
        timeout=10800,  # 3h max (eval takes extra time)
    )

    # Check if EMA checkpoint was created
    ema_path = Path(str(V16_CKPT).replace(".pt", "_ema.pt"))
    if ema_path.exists():
        print(f"[+] EMA checkpoint saved: {ema_path}")


def compare_versions(v15_metrics, v16_metrics):
    """Print comparison between V15 and V16."""
    if not v15_metrics or not v16_metrics:
        print("[!] Cannot compare -- missing metrics")
        return

    print(f"\n{'='*60}")
    print(f"  V15 vs V16 Comparison")
    print(f"{'='*60}")
    print(f"{'Metric':<12} {'V15':>8} {'V16':>8} {'Delta':>8}")
    print(f"{'-'*40}")

    v15m = v15_metrics['metrics']
    v16m = v16_metrics['metrics']
    for key in ['syntax', 'visual', 'semantic']:
        v15_val = v15m.get(key, 0)
        v16_val = v16m.get(key, 0)
        delta = v16_val - v15_val
        sign = "+" if delta > 0 else ""
        print(f"{key:<12} {v15_val:>8} {v16_val:>8} {sign}{delta:>7}")

    v15_total = sum(v15m[k] for k in ['syntax', 'visual', 'semantic'])
    v16_total = sum(v16m[k] for k in ['syntax', 'visual', 'semantic'])
    delta = v16_total - v15_total
    sign = "+" if delta > 0 else ""
    print(f"{'-'*40}")
    print(f"{'TOTAL':<12} {v15_total:>8} {v16_total:>8} {sign}{delta:>7}")

    if v16_total > v15_total:
        print(f"\n[+] V16 IMPROVES on V15 by {delta} points!")
    elif v16_total == v15_total:
        print(f"\n[=] V16 matches V15. Check per-category breakdown.")
    else:
        print(f"\n[-] V16 regresses from V15 by {-delta} points.")

    # Check EMA
    if V16_EMA_CKPT.exists():
        print(f"\n[*] EMA checkpoint available at {V16_EMA_CKPT}")
        print(f"    Run smoke_test.py on it to check if EMA-averaged model scores higher.")


def main():
    import argparse
    parser = argparse.ArgumentParser()
    parser.add_argument("--wait", action="store_true",
                        help="Poll for V15 completion before starting")
    parser.add_argument("--skip-distill", action="store_true",
                        help="Skip distillation (use existing)")
    parser.add_argument("--skip-train", action="store_true",
                        help="Skip training (use existing V16)")
    args = parser.parse_args()

    os.chdir(PROJECT)

    print("="*60)
    print("  PixelGPT V16 Automated Pipeline")
    print("="*60)

    # Step 0: Wait for V15
    if args.wait:
        wait_for_v15()
    else:
        # Just verify V15 exists
        if not V15_CKPT.exists():
            print(f"[!] V15 checkpoint not found at {V15_CKPT}")
            print("    Use --wait to poll for V15 completion.")
            sys.exit(1)
        import torch
        ckpt = torch.load(str(V15_CKPT), map_location='cpu', weights_only=False)
        print(f"[*] V15 checkpoint: epoch={ckpt.get('epoch')}, loss={ckpt.get('loss',0):.4f}")

    # Step 1: Smoke test V15 (baseline)
    print("\n[*] Step 1/5: Smoke testing V15 (baseline)...")
    v15_metrics = smoke_test(V15_CKPT, V15_RESULTS, label="V15")

    # Step 2: Self-distill
    if not args.skip_distill:
        print("\n[*] Step 2/5: Self-distilling V15 with hard-bias...")
        distill_stats = self_distill_v15()
    else:
        print("\n[*] Step 2/5: Skipping distillation (--skip-distill)")
        distill_stats = None

    # Step 3: Mix dataset (conservative 10% distilled ratio)
    print("\n[*] Step 3/5: Mixing dataset (10% distilled)...")
    mix_count = mix_v16_dataset()

    # Step 4: Build tokenized dataset
    print("\n[*] Step 4/5: Tokenizing dataset...")
    sample_count = build_dataset()

    # Step 5: Train V16
    if not args.skip_train:
        print("\n[*] Step 5/5: Training V16 (eval-guided early stopping)...")
        train_v16()
    else:
        print("\n[*] Step 5/5: Skipping training (--skip-train)")

    # Step 6: Smoke test V16
    if V16_CKPT.exists():
        print("\n[*] Final: Smoke testing V16...")
        v16_metrics = smoke_test(V16_CKPT, V16_RESULTS, label="V16")

        v15_total = sum(v15_metrics['metrics'].values()) if v15_metrics else 0
        v16_total = sum(v16_metrics['metrics'].values()) if v16_metrics else 0

        if v16_total < v15_total and v15_total > 0:
            print(f"\n[!] REGRESSION: V16 ({v16_total}/30) < V15 ({v15_total}/30)")
            print(f"    Keeping V15 as the best model. V16 saved for analysis.")
        else:
            compare_versions(v15_metrics, v16_metrics)
    else:
        print(f"\n[!] V16 checkpoint not found at {V16_CKPT}")

    print("\n" + "="*60)
    print("  Pipeline complete.")
    print("="*60)


if __name__ == "__main__":
    main()
