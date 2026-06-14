import os
import sys
import time
import subprocess
from pathlib import Path

# Geometry OS - Swarm Execution Autoresearch Runner
# Phase 50: Massive Parallelization

ROOT = Path(__file__).parent.parent.parent.absolute()
BENCHMARK_SCRIPT = ROOT / "systems" / "glyph_stratum" / "benchmark_gpu_native.py"
RESULTS_FILE = Path(__file__).parent / "swarm_results.tsv"

def run_experiment(description):
    """Run a swarm shader experiment and return the score."""
    start_time = time.time()
    
    print(f"● Benchmarking Swarm: {description}...")
    try:
        # Run the GPU benchmark in swarm mode
        res = subprocess.run([
            "python3", str(BENCHMARK_SCRIPT),
            "--mode", "swarm",
            "--iterations", "100"
        ], check=True, capture_output=True, text=True)
        
        output = res.stdout
        gips = 0
        fps = 0.0
        
        # Verify Correctness
        if "Swarm Agents Succeeded: 10000/10000" not in output:
            success_count = 0
            for line in output.split("\n"):
                if "Swarm Agents Succeeded:" in line:
                    success_count = line.split(":")[1].strip()
            return {"error": f"Swarm Correctness Failed: Only {success_count} agents succeeded."}
            
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
    print("● Swarm Autoresearch Runner Initialized")
    results = run_experiment("Baseline Swarm Check")
    log_result(results)
    
    if "error" in results:
        print(f"● ERROR: {results['error']}")
    else:
        print(f"● Swarm Baseline GIPS: {results.get('score', 0):,}")
