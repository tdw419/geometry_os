import os
import sys
import json
import time
import subprocess
from pathlib import Path

# Geometry OS - Glyph Microcode Autoresearch Runner
# Phase 45: Autonomous Shader Optimization

ROOT = Path(__file__).parent.parent.parent.absolute()
SHADER_PATH = ROOT / "systems" / "visual_shell" / "web" / "shaders" / "glyph_microcode.wgsl"
BENCHMARK_SCRIPT = ROOT / "systems" / "glyph_stratum" / "benchmark_gpu_native.py"
RESULTS_FILE = Path(__file__).parent / "glyph_results.tsv"

def run_experiment(description):
    """Run a single shader experiment and return the score."""
    start_time = time.time()
    
    # 1. Benchmark current shader
    print(f"● Benchmarking: {description}...")
    try:
        # Run the GPU benchmark for stress test to get a signal
        res = subprocess.run([
            "python3", str(BENCHMARK_SCRIPT),
            "--num-glyphs", "1000000",
            "--mode", "stress"
        ], check=True, capture_output=True, text=True)
        
        # Parse output for FPS and GIPS
        output = res.stdout
        gips = 0
        fps = 0.0
        
        # 2. Verify Correctness (Quick Factorial Check)
        verif = subprocess.run([
            "python3", str(BENCHMARK_SCRIPT),
            "--mode", "factorial"
        ], check=True, capture_output=True, text=True)
        
        if "Factorial Result (Register 1): 120" not in verif.stdout:
            return {"error": f"Correctness Failed: Factorial != 120. Got: {verif.stdout}"}
            
        for line in output.split("\n"):
            if "GIPS:" in line:
                gips = int(line.split(":")[1].replace(",", "").strip())
            if "FPS:" in line:
                fps = float(line.split(":")[1].strip())
                
    except subprocess.CalledProcessError as e:
        return {"error": f"Benchmark Crashed: {e.stderr}"}
    except Exception as e:
        return {"error": f"Parser Failed: {str(e)}"}

    return {
        "score": gips,
        "fps": fps,
        "description": description,
        "timestamp": time.ctime(),
        "total_time_s": time.time() - start_time
    }

def log_result(metrics):
    """Log result to TSV."""
    first_run = not RESULTS_FILE.exists()
    with open(RESULTS_FILE, "a") as f:
        if first_run:
            f.write("timestamp\tscore_gips\tfps\tdescription\n")
        if "error" in metrics:
            f.write(f"{time.ctime()}\t0\t0\tERROR: {metrics['error']}\n")
        else:
            f.write(f"{metrics['timestamp']}\t{metrics['score']}\t{metrics['fps']}\t{metrics['description']}\n")

if __name__ == "__main__":
    # If run directly, just do a baseline check
    print("● Glyph Autoresearch Runner Initialized")
    results = run_experiment("Baseline Check")
    log_result(results)
    print(f"● Baseline GIPS: {results.get('score', 0):,}")
