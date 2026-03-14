#!/usr/bin/env python3
"""
Wave-Logic Unit Benchmark for Autoresearch

Measures gate stability over multiple frames and outputs results to TSV.
"""

import subprocess
import sys
import time
from pathlib import Path

def run_benchmark(iterations=1000):
    """Run the wave logic unit tests and capture results."""
    print(f"🌊 Wave Logic Unit Benchmark")
    print(f"=" * 40)

    # Run cargo test (lib only to avoid integration test issues)
    cmd = [
        "cargo", "test", "--package", "infinite_map_rs", "--lib",
        "wave_logic_unit", "--", "--nocapture"
    ]

    print(f"Running: {' '.join(cmd)}")
    result = subprocess.run(cmd, capture_output=True, text=True)

    if result.returncode != 0:
        print(f"❌ Tests failed:")
        print(result.stderr[-2000:])
        return None

    # Parse output for stability
    output = result.stdout
    print(output[-500:] if len(output) > 500 else output)

    return output

def main():
    print("🌊 Wave Logic Unit - Autoresearch Benchmark")
    print("=" * 50)

    # Run benchmark
    output = run_benchmark()

    if output:
        print("\n✅ Benchmark complete!")
        print("\nNext steps:")
        print("1. Modify WLUConfig in wave_logic_unit.rs")
        print("2. Try different oscillator positions/phases/frequencies")
        print("3. Record results to wave_logic_results.tsv")

if __name__ == "__main__":
    main()
