import os
import sys
import json
import time
import subprocess
from pathlib import Path

# Paths
ROOT = Path(__file__).parent.parent.parent.absolute()
JIT_SCRIPT = ROOT / "systems" / "pixel_compiler" / "riscv_to_geometric_vm.py"
BENCHMARK_SCRIPT = ROOT / "systems" / "pixel_compiler" / "benchmark_locality.py"
LINUX_KERNEL = ROOT / "systems" / "ubuntu_riscv" / "vmlinux"
RESULTS_FILE = Path(__file__).parent / "linux_results.tsv"
GOLDEN_DIR = Path(__file__).parent / "golden_bricks"

def run_experiment(description):
    """Run a single crystallization experiment and return the score."""
    start_time = time.time()
    temp_brick = "/tmp/research_brick.rts.png"
    
    # 1. Crystallize
    print(f"● Crystallizing: {description}...")
    try:
        subprocess.run([
            "python3", str(JIT_SCRIPT),
            str(LINUX_KERNEL),
            temp_brick
        ], check=True, capture_output=True)
    except subprocess.CalledProcessError as e:
        return {"error": f"Crystallization Failed: {e.stderr.decode()}"}

    # 2. Benchmark
    print(f"● Benchmarking...")
    try:
        res = subprocess.run([
            "python3", str(BENCHMARK_SCRIPT),
            "--brick", temp_brick
        ], check=True, capture_output=True)
        metrics = json.loads(res.stdout)
    except Exception as e:
        return {"error": f"Benchmark Failed: {str(e)}"}

    metrics["description"] = description
    metrics["timestamp"] = time.ctime()
    metrics["total_time_s"] = time.time() - start_time
    
    return metrics

def log_result(metrics):
    """Log result to TSV and check for new record."""
    first_run = not RESULTS_FILE.exists()
    
    with open(RESULTS_FILE, "a") as f:
        if first_run:
            f.write("timestamp\tscore\ttime_ms\tdescription\n")
        f.write(f"{metrics['timestamp']}\t{metrics['locality_score']}\t{metrics['crystallization_time_ms']}\t{metrics['description']}\n")

    # Check for record
    scores = []
    if RESULTS_FILE.exists():
        with open(RESULTS_FILE, "r") as f:
            lines = f.readlines()[1:]
            scores = [float(line.split("\t")[1]) for line in lines]
    
    is_record = metrics['locality_score'] >= max(scores) if scores else True
    if is_record:
        print(f"🏆 NEW RECORD: {metrics['locality_score']:.6f}")
        GOLDEN_DIR.mkdir(exist_ok=True)
        golden_path = GOLDEN_DIR / f"ubuntu_vmlinux_record_{metrics['locality_score']:.6f}.rts.png"
        subprocess.run(["cp", "/tmp/research_brick.rts.png", str(golden_path)])
        subprocess.run(["cp", "/tmp/research_brick.rts.png.meta.json", str(golden_path) + ".meta.json"])

if __name__ == "__main__":
    if len(sys.argv) < 2:
        desc = "Manual Research Turn"
    else:
        desc = " ".join(sys.argv[1:])
        
    result = run_experiment(desc)
    if "error" in result:
        print(f"❌ {result['error']}")
    else:
        print(f"✅ Score: {result['locality_score']:.6f} | Time: {result['crystallization_time_ms']:.2f}ms")
        log_result(result)
