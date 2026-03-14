import os
import sys
import json
import time
import subprocess
from pathlib import Path

# Geometry OS - Glyph Microcode Autoresearch Runner
# Phase 45: Autonomous Shader Optimization

ROOT = Path(__file__).parent.parent.parent.absolute()
SHADER_PATH = ROOT / "systems" / "glyph_boot" / "src" / "shaders" / "glyph_vm_scheduler.wgsl"
BENCHMARK_SCRIPT = ROOT / "systems" / "glyph_stratum" / "benchmark_gpu_native.py"
RESULTS_FILE = Path(__file__).parent / "glyph_results.tsv"

def run_experiment(description):
    """Run a single shader experiment and return the score."""
    start_time = time.time()

    # 1. Benchmark current shader
    print(f"● Benchmarking: {description}...")
    try:
        # Run the GPU benchmark (stress mode for true parallel throughput)
        res = subprocess.run([
            "python3", str(BENCHMARK_SCRIPT),
            "--mode", "stress",
            "--num-glyphs", "1000000"
        ], capture_output=True, text=True, timeout=60)

        # Parse output for FPS and GIPS
        output = res.stdout + res.stderr
        gips = 0.0
        fps = 0.0
        tests_passed = False

        for line in output.split("\n"):
            if "GIPS:" in line:
                gips = float(line.split(":")[1].strip())
            if "FPS:" in line:
                fps = float(line.split(":")[1].strip())
            if "r2=120" in line or "r2 = 120" in line:
                tests_passed = True
            if "Tests:" in line and "passed" in line:
                parts = line.split("passed")[0].split()[-1]
                if int(parts) > 0:
                    tests_passed = True

        # Note: Factorial test may not pass yet - still optimizing
        # Return results even if test fails for now
                
    except subprocess.CalledProcessError as e:
        return {"error": f"Benchmark Crashed: {e.stderr}"}
    except subprocess.TimeoutExpired:
        return {"error": "Benchmark timed out (>60s)"}
    except Exception as e:
        return {"error": f"Parser Failed: {str(e)}"}

    return {
        "score": gips,
        "fps": fps,
        "tests_passed": tests_passed,
        "description": description,
        "timestamp": time.ctime(),
        "total_time_s": time.time() - start_time
    }

def log_result(metrics):
    """Log result to TSV."""
    first_run = not RESULTS_FILE.exists()
    with open(RESULTS_FILE, "a") as f:
        if first_run:
            f.write("timestamp\tscore_gips\tfps\ttests\tdescription\n")
        if "error" in metrics:
            f.write(f"{time.ctime()}\t0\t0\tFAIL\tERROR: {metrics['error']}\n")
        else:
            status = "PASS" if metrics.get("tests_passed", False) else "FAIL"
            f.write(f"{metrics['timestamp']}\t{metrics['score']:.4f}\t{metrics['fps']:.1f}\t{status}\t{metrics['description']}\n")

if __name__ == "__main__":
    # If run directly, just do a baseline check
    print("● Glyph Autoresearch Runner Initialized")
    results = run_experiment("Baseline Check")
    log_result(results)

    if "error" in results:
        print(f"● Error: {results['error']}")
    else:
        print(f"● Baseline GIPS: {results['score']:.4f} | FPS: {results['fps']:.1f} | Tests: {'PASS' if results.get('tests_passed') else 'FAIL'}")
