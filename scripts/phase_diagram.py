#!/usr/bin/env python3
"""
Kernel Phase Diagram Stress Test

Runs the kernel for 10K ticks across 4 ablation modes and collects
phase diagram samples. Outputs CSV for analysis.

Usage:
    python3 scripts/phase_diagram.py [--ticks 10000] [--sample-interval 100] [--output results.csv]

Ablation modes:
    1. full          — all subsystems active (baseline)
    2. no_memory     — memory bias + novelty pressure disabled
    3. no_novelty    — novelty pressure disabled (memory bias stays)
    4. no_tec        — telemetry disabled (tests TEC isolation)

This is NOT a unit test. It's a dynamical systems measurement tool.
The output CSV has one row per sample, with columns for every PhaseSample field.
Analysis is done externally (plotting, statistical tests, etc.)
"""

import subprocess
import sys
import os
import csv
import argparse

# The Rust test binary name
TEST_BIN = "kernel_phase_diagram"
MANIFEST_PATH = os.path.join(os.path.dirname(__file__), "..", "Cargo.toml")


def build():
    """Build the phase diagram test binary."""
    print("Building phase diagram binary...")
    result = subprocess.run(
        ["cargo", "build", "--release", "--features", "gpu", "--bin", TEST_BIN],
        cwd=os.path.join(os.path.dirname(__file__), ".."),
        capture_output=True,
        text=True,
    )
    if result.returncode != 0:
        print(f"Build failed:\n{result.stderr}")
        sys.exit(1)
    print("Build succeeded.")


def run_mode(mode: str, ticks: int, sample_interval: int) -> list[dict]:
    """Run one ablation mode and return parsed CSV rows."""
    print(f"\nRunning mode: {mode} ({ticks} ticks, sample every {sample_interval})...")

    result = subprocess.run(
        [
            "cargo", "run", "--release", "--features", "gpu", "--bin", TEST_BIN,
            "--", "--mode", mode, "--ticks", str(ticks),
            "--sample-interval", str(sample_interval),
        ],
        cwd=os.path.join(os.path.dirname(__file__), ".."),
        capture_output=True,
        text=True,
        timeout=600,  # 10 min timeout per mode
    )

    if result.returncode != 0:
        print(f"Run failed for mode {mode}:\n{result.stderr}")
        sys.exit(1)

    # Parse CSV from stdout
    rows = []
    header = None
    for line in result.stdout.strip().split("\n"):
        if line.startswith("#"):
            continue
        if header is None:
            header = line.split(",")
        else:
            values = line.split(",")
            row = {}
            for h, v in zip(header, values):
                try:
                    row[h] = float(v)
                except ValueError:
                    row[h] = v
            row["mode"] = mode
            rows.append(row)

    print(f"  Got {len(rows)} samples.")
    return rows


def analyze(all_rows: list[dict]):
    """Print summary statistics for each mode."""
    modes = {}
    for row in all_rows:
        mode = row["mode"]
        modes.setdefault(mode, []).append(row)

    print("\n" + "=" * 80)
    print("PHASE DIAGRAM SUMMARY")
    print("=" * 80)

    for mode, rows in sorted(modes.items()):
        if not rows:
            continue

        print(f"\n--- Mode: {mode} ({len(rows)} samples) ---")

        # TEC
        tecs = [r["tec"] for r in rows]
        print(f"  TEC:          mean={avg(tecs):.4f}  std={std(tecs):.4f}  "
              f"min={min(tecs):.4f}  max={max(tecs):.4f}")

        # TEC gradient
        grads = [r["tec_gradient"] for r in rows]
        print(f"  TEC gradient: mean={avg(grads):.6f}  "
              f"final={grads[-1] if grads else 0:.6f}")

        # Effective dimensionality
        dims = [r["effective_dimensionality"] for r in rows]
        print(f"  Eff. dim:     mean={avg(dims):.2f}  "
              f"first={dims[0] if dims else 0}  last={dims[-1] if dims else 0}")

        # Histogram entropy
        hist_ents = [r["avg_histogram_entropy"] for r in rows]
        print(f"  Hist entropy: mean={avg(hist_ents):.4f}  "
              f"std={std(hist_ents):.4f}")

        # Histogram coverage
        hist_covs = [r["histogram_coverage"] for r in rows]
        print(f"  Hist coverage: mean={avg(hist_covs):.4f}  "
              f"final={hist_covs[-1] if hist_covs else 0:.4f}")

        # Repetition score
        reps = [r["avg_repetition_score"] for r in rows]
        print(f"  Repetition:   mean={avg(reps):.4f}  "
              f"max={max(reps):.4f}")

        # Memory reuse
        reuses = [r["memory_reuse_rate"] for r in rows]
        print(f"  Mem reuse:    mean={avg(reuses):.4f}  "
              f"final={reuses[-1] if reuses else 0:.4f}")

        # CF divergence
        dists = [r["cf_mean_pairwise_distance"] for r in rows]
        if any(d > 0 for d in dists):
            print(f"  CF distance:  mean={avg(dists):.2f}  "
                  f"trend={trend(dists):+.2f}")
        else:
            print(f"  CF distance:  N/A (no CFs or single CF)")

        # Eigenvalues
        eigs = [(r["eigenvalue_0"], r["eigenvalue_1"], r["eigenvalue_2"], r["eigenvalue_3"])
                for r in rows]
        if eigs:
            print(f"  Eigenvalues (final): "
                  f"[{eigs[-1][0]:.1f}, {eigs[-1][1]:.1f}, {eigs[-1][2]:.1f}, {eigs[-1][3]:.1f}]")

        # Semantic manifold (v8.3)
        sem_vars = [r.get("semantic_variance", 0) for r in rows]
        sem_dims = [r.get("semantic_dimensionality", 0) for r in rows]
        print(f"  Sem variance: mean={avg(sem_vars):.6f}  "
              f"first={sem_vars[0] if sem_vars else 0:.6f}  "
              f"last={sem_vars[-1] if sem_vars else 0:.6f}")
        print(f"  Sem dim:      mean={avg(sem_dims):.2f}  "
              f"trend={trend(sem_dims):+.2f}")
        sem_eigs = [(r.get("sem_eigenvalue_0", 0), r.get("sem_eigenvalue_1", 0),
                     r.get("sem_eigenvalue_2", 0), r.get("sem_eigenvalue_3", 0))
                    for r in rows]
        if sem_eigs and any(e > 0 for e in sem_eigs[-1]):
            print(f"  Sem eigen (final): "
                  f"[{sem_eigs[-1][0]:.1f}, {sem_eigs[-1][1]:.1f}, "
                  f"{sem_eigs[-1][2]:.1f}, {sem_eigs[-1][3]:.1f}]")

    # ── Cross-mode comparison ──
    print("\n" + "-" * 60)
    print("REGIME DIAGNOSIS:")
    print("-" * 60)

    for mode, rows in sorted(modes.items()):
        if not rows:
            continue

        dims = [r["effective_dimensionality"] for r in rows]
        tecs = [r["tec"] for r in rows]
        reps = [r["avg_repetition_score"] for r in rows]
        hist_covs = [r["histogram_coverage"] for r in rows]

        dim_stable = std(dims) < 0.5
        dim_final = dims[-1] if dims else 0
        tec_stable = std(tecs) / max(avg(tecs), 0.001) < 0.3 if len(tecs) > 1 else True

        if dim_final >= 3 and dim_stable and tec_stable:
            regime = "TRUE EXPLORATION"
        elif dim_final <= 2 or (not dim_stable and dim_final < 3):
            regime = "HIDDEN ATTRACTOR (dimensionality collapse)"
        elif avg(reps) > 0.3 and avg(hist_covs) < 0.5:
            regime = "CONTROLLED CHAOS (high entropy, low coverage)"
        else:
            regime = "TRANSITIONAL / UNSTABLE"

        print(f"  {mode:12s}: {regime}")
        print(f"                dim={dim_final:.1f} (σ={std(dims):.2f})  "
              f"tec={avg(tecs):.3f}  rep={avg(reps):.3f}")


def avg(values):
    return sum(values) / len(values) if values else 0


def std(values):
    if len(values) < 2:
        return 0
    m = avg(values)
    return (sum((v - m) ** 2 for v in values) / len(values)) ** 0.5


def trend(values):
    """Simple linear trend (slope of last 30% of values)."""
    if len(values) < 4:
        return 0
    n = max(2, len(values) * 3 // 10)
    recent = values[-n:]
    return (recent[-1] - recent[0]) / max(n, 1)


def main():
    parser = argparse.ArgumentParser(description="Kernel Phase Diagram Stress Test")
    parser.add_argument("--ticks", type=int, default=10000, help="Ticks per mode")
    parser.add_argument("--sample-interval", type=int, default=100, help="Sample every N ticks")
    parser.add_argument("--output", type=str, default=None, help="CSV output file")
    args = parser.parse_args()

    build()

    all_rows = []
    for mode in ["full", "no_memory", "no_novelty", "no_tec"]:
        rows = run_mode(mode, args.ticks, args.sample_interval)
        all_rows.extend(rows)

    if args.output:
        with open(args.output, "w", newline="") as f:
            if all_rows:
                writer = csv.DictWriter(f, fieldnames=all_rows[0].keys())
                writer.writeheader()
                writer.writerows(all_rows)
        print(f"\nResults written to {args.output}")

    analyze(all_rows)


if __name__ == "__main__":
    main()
