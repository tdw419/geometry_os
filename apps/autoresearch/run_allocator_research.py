import os
import sys
import json
import time
import subprocess
from pathlib import Path

# Geometry OS - Glyph Allocator Autoresearch Runner
# Phase ?: Autonomous Memory Allocator Evolution

ROOT = Path(__file__).parent.parent.parent.absolute()
ALLOCATOR_PATH = ROOT / "systems" / "glyph_allocator"
CARGO_TOML = ALLOCATOR_PATH / "Cargo.toml"
RESULTS_FILE = Path(__file__).parent / "results_fitness.tsv"


def run_experiment(description):
    """Run a single allocator experiment and return the fitness score."""
    start_time = time.time()

    print(f"● Testing allocator: {description}...")

    try:
        # Run cargo test to build and test the allocator
        build_result = subprocess.run(
            ["cargo", "test", "--manifest-path", str(CARGO_TOML), "--", "--nocapture"],
            capture_output=True,
            text=True,
            cwd=str(ALLOCATOR_PATH),
        )

        if build_result.returncode != 0:
            return {
                "error": f"Build/Test Failed: {build_result.stderr}",
                "timestamp": time.ctime(),
                "total_time_s": time.time() - start_time,
            }

        # Run the fitness evaluation binary
        fitness_result = subprocess.run(
            ["cargo", "run", "--manifest-path", str(CARGO_TOML), "--release"],
            capture_output=True,
            text=True,
            cwd=str(ALLOCATOR_PATH),
        )

        if fitness_result.returncode != 0:
            return {
                "error": f"Fitness Evaluation Failed: {fitness_result.stderr}",
                "timestamp": time.ctime(),
                "total_time_s": time.time() - start_time,
            }

        # Parse fitness score from output
        output = fitness_result.stdout
        fitness_score = 0.0

        for line in output.split("\n"):
            if "Fitness Score:" in line:
                try:
                    # Extract percentage and convert to decimal
                    score_str = line.split(":")[1].strip().replace("%", "")
                    fitness_score = float(score_str) / 100.0
                except:
                    fitness_score = 0.0
                break

        # If we couldn't parse from stdout, try stderr
        if fitness_score == 0.0:
            for line in fitness_result.stderr.split("\n"):
                if "Fitness Score:" in line:
                    try:
                        score_str = line.split(":")[1].strip().replace("%", "")
                        fitness_score = float(score_str) / 100.0
                    except:
                        fitness_score = 0.0
                    break

    except Exception as e:
        return {
            "error": f"Experiment Failed: {str(e)}",
            "timestamp": time.ctime(),
            "total_time_s": time.time() - start_time,
        }

    return {
        "fitness_score": fitness_score,
        "description": description,
        "timestamp": time.ctime(),
        "total_time_s": time.time() - start_time,
    }


def log_result(metrics):
    """Log result to TSV."""
    first_run = not RESULTS_FILE.exists()
    with open(RESULTS_FILE, "a") as f:
        if first_run:
            f.write("timestamp\tfitness_score\tdescription\n")
        if "error" in metrics:
            f.write(f"{metrics['timestamp']}\t0\tERROR: {metrics['error']}\n")
        else:
            f.write(
                f"{metrics['timestamp']}\t{metrics['fitness_score']}\t{metrics['description']}\n"
            )


if __name__ == "__main__":
    # If run directly, just do a baseline check
    print("● Glyph Allocator Autoresearch Runner Initialized")
    results = run_experiment("Baseline Check")
    log_result(results)
    if "error" in results:
        print(f"● Error: {results['error']}")
    else:
        fitness = results.get('fitness_score', 0)
        print(f"● Baseline Fitness: {fitness:.2%}")
        # Output in format expected by parse_benchmark_output
        print(f"Fitness Score: {fitness:.2%}")
        print("PASS")
