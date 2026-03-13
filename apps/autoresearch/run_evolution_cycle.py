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
        "name": "THE CORE (Allocator & VRAM Fitness)",
        "duration_hours": 6,
        "program": "apps/autoresearch/program_linux_opt.md",  # Using linux_opt as a proxy for substrate/core
        "target_metric": "Allocator Fitness",
        "objective": "Maximize VRAM allocation efficiency (Target: 95%+ Fitness)."
    },
    {
        "name": "THE BODY (Morphological Growth)",
        "duration_hours": 3,
        "program": "apps/autoresearch/program_spatial_spawn.md",
        "target_metric": "Spawn Success Rate",
        "objective": "Enable recursive self-replication using SPATIAL_SPAWN."
    },
    {
        "name": "THE OUROBOROS (Full System Resilience)",
        "duration_hours": 3,
        "program": "apps/autoresearch/program_ouroboros.md",
        "target_metric": "Aggregate Score",
        "objective": "Simultaneous optimization of Speed, Entropy, and Growth."
    }
]

def parse_benchmark_output(output: str) -> dict:
    """Parse benchmark output to extract metrics."""
    result = {"gips": 0, "fps": 0, "status": "fail", "allocator_fitness": 0}
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
        if "Fitness Score:" in line:
            try:
                # Extract percentage and convert to decimal
                score_str = line.split(":")[1].strip().replace("%", "")
                result["allocator_fitness"] = float(score_str) / 100.0
            except:
                pass
        if "PASS" in line or "✅" in line:
            result["status"] = "pass"
    return result

def run_benchmark(track_name="") -> dict:
    """Run the glyph benchmark and return results."""
    try:
        # If we're on the CORE track, run the allocator research runner
        if "CORE" in track_name:
            result = subprocess.run(
                ["python3", str(ROOT / "apps/autoresearch/run_allocator_research.py")],
                capture_output=True,
                text=True,
                timeout=60,
                cwd=str(ROOT)
            )
        else:
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

def apply_random_optimization(track_name="") -> str:
    """Apply a random optimization to the shader or allocator. Returns description."""
    
    if "CORE" in track_name:
        # Real optimization for the allocator
        alloc_path = ROOT / "systems" / "glyph_allocator" / "src" / "glyph_allocator.rs"
        if not alloc_path.exists():
            return "Allocator source not found"
            
        with open(alloc_path, "r") as f:
            code = f.read()
            
        opt = random.choice(["best_fit", "alignment_tweak"])
        
        if opt == "best_fit":
            # Replace First-Fit with Best-Fit
            first_fit = """        if let Some(pos) = self
            .free_list
            .iter()
            .position(|&(_, free_size)| free_size >= aligned_size)"""
            
            best_fit = """        if let Some(pos) = self
            .free_list
            .iter()
            .enumerate()
            .filter(|&(_, &(_, free_size))| free_size >= aligned_size)
            .min_by_key(|&(_, &(_, free_size))| free_size)
            .map(|(pos, _)| pos)"""
            
            if first_fit in code:
                code = code.replace(first_fit, best_fit)
                description = "Applied Best-Fit allocation strategy"
            else:
                description = "Best-Fit already applied or location not found"
                
        elif opt == "alignment_tweak":
            # Tweak alignment to 128 instead of 256 for small blocks
            old_align = "let aligned_size = ((size_in_bytes + 255) / 256) * 256;"
            new_align = "let aligned_size = ((size_in_bytes + 127) / 128) * 128;"
            if old_align in code:
                code = code.replace(old_align, new_align)
                description = "Tweaked alignment to 128-byte boundaries"
            else:
                description = "Alignment tweak already applied or location not found"

        with open(alloc_path, "w") as f:
            f.write(code)
            
        return description

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

def update_dashboard(current_track, start_time, total_experiments, best_gips, best_fitness, last_result):
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
- **Best Allocator Fitness**: {best_fitness:.2%}
- **Last Result**: GIPS={last_result.get('gips', 0):,.0f}, Fitness={last_result.get('allocator_fitness', 0):.2%}, Status={last_result.get('status', 'unknown')}

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
    best_fitness = 0.8366  # Initial baseline
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
                opt_desc = apply_random_optimization(track['name'])

                # 2. Run benchmark
                print(f"  [#{experiment_count:03}] Running benchmark...", end=" ", flush=True)
                result = run_benchmark(track['name'])

                # 3. Record result
                timestamp = datetime.now().isoformat()
                metric_value = result['allocator_fitness'] if "CORE" in track['name'] else result['gips']
                
                with open(RESULTS_TSV, "a") as f:
                    f.write(f"{timestamp}\t{track['name'][:20]}\t{track['target_metric']}\t{metric_value}\t{opt_desc[:30]}\t{result['status']}\n")

                # 4. Check for new champions
                if result.get("gips", 0) > best_gips and result["status"] == "pass":
                    best_gips = result["gips"]
                    shutil.copy(SHADER_PATH, CHAMPION_PATH)
                    print(f"🏆 NEW SHADER CHAMPION! GIPS={best_gips:,.0f}")
                
                if result.get("allocator_fitness", 0) > best_fitness:
                    best_fitness = result["allocator_fitness"]
                    print(f"🏆 NEW ALLOCATOR CHAMPION! Fitness={best_fitness:.2%}")

                if "CORE" in track['name']:
                    print(f"Fitness={result['allocator_fitness']:.2%} ({result['status']})")
                else:
                    print(f"GIPS={result.get('gips', 0):,.0f} ({result['status']})")

                last_result = result

                # 5. Update dashboard
                update_dashboard(track, start_time, total_experiments, best_gips, best_fitness, last_result)

                # 6. Brief pause between experiments
                time.sleep(30)  # 30 seconds between experiments

            print(f"\n✅ Track {track['name']} Complete. Experiments: {experiment_count}")

    except KeyboardInterrupt:
        print("\n🛑 Evolution Cycle Interrupted by User.")
    finally:
        print(f"\n🏁 Evolution Cycle Finished at {datetime.now()}")
        print(f"   Total Experiments: {total_experiments}")
        print(f"   Best GIPS: {best_gips:,.0f}")
        update_dashboard(TRACKS[-1], start_time, total_experiments, best_gips, best_fitness, last_result)

if __name__ == "__main__":
    run_evolution_cycle()
