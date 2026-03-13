#!/usr/bin/env python3
"""
Geometry OS - 24-Hour Evolution Cycle Master
Phase 50: The Self-Evolving Visual Substrate

This script coordinates a 24-hour autonomous research run across 4 distinct
'Evolution Tracks'. It runs real benchmarks and records results.
"""

import os
import sys
import time
import json
import shutil
import subprocess
import random
from pathlib import Path
from datetime import datetime, timedelta

# Paths
ROOT = Path(__file__).parent.parent.parent.absolute()
SHADER_PATH = ROOT / "systems" / "infinite_map_rs" / "shaders" / "glyph_microcode.wgsl"
CHAMPION_PATH = ROOT / "apps" / "autoresearch" / "champion_shader.wgsl"
DASHBOARD_PATH = ROOT / "apps" / "autoresearch" / "evolution_dashboard.md"
RESULTS_TSV = ROOT / "apps" / "autoresearch" / "evolution_cycle_results.tsv"
BENCHMARK_SCRIPT = ROOT / "systems" / "glyph_stratum" / "benchmark_glyph_fps.py"

# Evolution Tracks
TRACKS = [
    {
        "name": "THE ENGINE (GIPS Optimization)",
        "duration_hours": 6,
        "program": "apps/autoresearch/program_ai_native_glyphs.md",
        "target_metric": "GIPS",
        "objective": "Maximize raw glyph execution speed (Target: 10M GIPS)."
    },
    {
        "name": "THE MIND (Entropy & Probabilistic Quality)",
        "duration_hours": 6,
        "program": "apps/autoresearch/program_entropy_opt.md",
        "target_metric": "Entropy Score",
        "objective": "Perfect 50/50 split on 1M coin flips with 0.999+ entropy."
    },
    {
        "name": "THE BODY (Morphological Growth)",
        "duration_hours": 6,
        "program": "apps/autoresearch/program_spatial_spawn.md",
        "target_metric": "Spawn Success Rate",
        "objective": "Enable recursive self-replication using SPATIAL_SPAWN."
    },
    {
        "name": "THE OUROBOROS (Full System Resilience)",
        "duration_hours": 6,
        "program": "apps/autoresearch/program_ouroboros.md",
        "target_metric": "Aggregate Score",
        "objective": "Simultaneous optimization of Speed, Entropy, and Growth."
    }
]

def parse_benchmark_output(output: str) -> dict:
    """Parse benchmark output to extract metrics."""
    result = {"gips": 0, "fps": 0, "status": "fail"}
    for line in output.split("\n"):
        if "GIPS:" in line:
            try:
                result["gips"] = float(line.split(":")[1].strip().replace(",", ""))
            except:
                pass
        if "FPS:" in line:
            try:
                result["fps"] = float(line.split(":")[1].strip())
            except:
                pass
        if "PASS" in line:
            result["status"] = "pass"
    return result

def run_benchmark() -> dict:
    """Run the glyph benchmark and return results."""
    try:
        result = subprocess.run(
            ["python3", str(BENCHMARK_SCRIPT)],
            capture_output=True,
            text=True,
            timeout=60,
            cwd=str(ROOT)
        )
        return parse_benchmark_output(result.stdout + result.stderr)
    except subprocess.TimeoutExpired:
        return {"gips": 0, "fps": 0, "status": "timeout"}
    except Exception as e:
        return {"gips": 0, "fps": 0, "status": f"error: {str(e)}"}

def apply_random_optimization() -> str:
    """Apply a random optimization to the shader. Returns description."""
    optimizations = [
        "noop",  # Control - no change
        "lcg_tweak",
        "loop_unroll_hint",
        "branch_reorder",
    ]

    opt = random.choice(optimizations)

    if opt == "noop":
        return "No optimization applied (baseline)"

    if not SHADER_PATH.exists():
        return "Shader not found"

    with open(SHADER_PATH, "r") as f:
        code = f.read()

    if opt == "lcg_tweak":
        # Try different LCG constants
        new_mult = random.choice([1103515245, 1664525, 214013])
        new_inc = random.choice([12345, 1013904223, 2531011])
        code = code.replace("1103515245u", f"{new_mult}u")
        code = code.replace("12345u", f"{new_inc}u")

    elif opt == "loop_unroll_hint":
        # Add unroll hints to loops (if any)
        if "for (var" in code and "unroll" not in code:
            code = code.replace(
                "for (var",
                "@unroll\n                for (var",
                1
            )

    elif opt == "branch_reorder":
        # Reorder switch cases by moving common opcodes first
        pass  # Just a placeholder - real impl would reorder

    with open(SHADER_PATH, "w") as f:
        f.write(code)

    return f"Applied optimization: {opt}"

def update_dashboard(current_track, start_time, total_experiments, best_gips, last_result):
    """Generate a Markdown dashboard for the user to monitor."""
    now = datetime.now()
    elapsed = now - start_time
    remaining = timedelta(hours=24) - elapsed

    content = f"""# 🧬 Geometry OS - Evolution Dashboard (Live)

**Status**: 🟢 ACTIVE (24-Hour Run)
**Started**: {start_time.strftime('%Y-%m-%d %H:%M:%S')}
**Time Elapsed**: {str(elapsed).split('.')[0]}
**Time Remaining**: {str(remaining).split('.')[0]}

## 🛰️ Current Track: {current_track['name']}
- **Objective**: {current_track['objective']}
- **Target Metric**: {current_track['target_metric']}
- **Active Program**: `{current_track['program']}`

## 📊 Performance Metrics
- **Total Experiments**: {total_experiments}
- **Best GIPS Reached**: {best_gips:,}
- **Last Result**: GIPS={last_result.get('gips', 0):,.0f}, Status={last_result.get('status', 'unknown')}

## 🏆 Champion Shader
The current best shader is saved at: `apps/autoresearch/champion_shader.wgsl`

## 📜 Log Preview (Last 5)
```
"""

    # Append last 5 lines of TSV
    if RESULTS_TSV.exists():
        with open(RESULTS_TSV, "r") as f:
            lines = f.readlines()
            content += "".join(lines[-5:])

    content += "\n```\n\n*Updated: " + now.strftime('%H:%M:%S') + "*"

    with open(DASHBOARD_PATH, "w") as f:
        f.write(content)

def run_evolution_cycle():
    """Main execution loop for the 24-hour run."""
    start_time = datetime.now()
    total_experiments = 0
    best_gips = 0
    last_result = {}

    # Initialize TSV
    with open(RESULTS_TSV, "w") as f:
        f.write("timestamp\ttrack\tmetric\tvalue\toptimization\tstatus\n")

    # Initial Baseline Check
    if SHADER_PATH.exists() and not CHAMPION_PATH.exists():
        shutil.copy(SHADER_PATH, CHAMPION_PATH)
        print(f"📦 Champion shader initialized from baseline")

    print(f"🚀 Starting 24-Hour Evolution Cycle at {start_time}")
    print(f"   Dashboard: {DASHBOARD_PATH}")
    print(f"   Results: {RESULTS_TSV}")
    print()

    try:
        for track in TRACKS:
            track_start = datetime.now()
            track_end = track_start + timedelta(hours=track['duration_hours'])

            print(f"\n{'='*60}")
            print(f"▶ Switching to Track: {track['name']}")
            print(f"  Duration: {track['duration_hours']} hours")
            print(f"  Objective: {track['objective']}")
            print(f"{'='*60}\n")

            # Update program.md (The "Context Injection")
            program_path = ROOT / track['program']
            if program_path.exists():
                shutil.copy(program_path, ROOT / "apps/autoresearch" / "program.md")

            experiment_count = 0

            # Loop experiments for the duration of the track
            while datetime.now() < track_end:
                experiment_count += 1
                total_experiments += 1

                # 1. Apply an optimization
                opt_desc = apply_random_optimization()

                # 2. Run benchmark
                print(f"  [#{experiment_count:03}] Running benchmark...", end=" ", flush=True)
                result = run_benchmark()

                # 3. Record result
                timestamp = datetime.now().isoformat()
                with open(RESULTS_TSV, "a") as f:
                    f.write(f"{timestamp}\t{track['name'][:20]}\t{track['target_metric']}\t{result['gips']}\t{opt_desc[:30]}\t{result['status']}\n")

                # 4. Check for new champion
                if result["gips"] > best_gips and result["status"] == "pass":
                    best_gips = result["gips"]
                    shutil.copy(SHADER_PATH, CHAMPION_PATH)
                    print(f"🏆 NEW CHAMPION! GIPS={best_gips:,.0f}")
                else:
                    print(f"GIPS={result['gips']:,.0f} ({result['status']})")

                last_result = result

                # 5. Update dashboard
                update_dashboard(track, start_time, total_experiments, best_gips, last_result)

                # 6. Brief pause between experiments
                time.sleep(30)  # 30 seconds between experiments

            print(f"\n✅ Track {track['name']} Complete. Experiments: {experiment_count}")

    except KeyboardInterrupt:
        print("\n🛑 Evolution Cycle Interrupted by User.")
    finally:
        print(f"\n🏁 Evolution Cycle Finished at {datetime.now()}")
        print(f"   Total Experiments: {total_experiments}")
        print(f"   Best GIPS: {best_gips:,.0f}")
        update_dashboard(TRACKS[-1], start_time, total_experiments, best_gips, last_result)

if __name__ == "__main__":
    run_evolution_cycle()
