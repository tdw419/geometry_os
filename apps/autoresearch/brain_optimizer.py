#!/usr/bin/env python3
"""
Brain Optimizer - Autonomous Researcher for Phase 41/42
This is the target file for the Autoresearch agent.
It optimizes the cognitive parameters of the Ouroboros Repair Engine.
"""

import sys
import os
import json
import subprocess
from pathlib import Path

# --- PARAMETERS TO OPTIMIZE ---
# The agent will modify these values to improve the Efficiency Score.
# Gen 2: Increased scan density and heal radius for better coverage
SCAN_THRESHOLD = 0.55  # Lower threshold = catch more fractures
HEAL_RADIUS_BASE = 12   # Larger radius = more pixels healed per mutation
GAUSSIAN_SIGMA = 2.5    # Slightly wider falloff
TARGET_ENTROPY_MULT = 0.45  # Target lower entropy
SAMPLE_STEP = 8         # Scan every 8 pixels (2x density)
# ------------------------------

BENCHMARK_SCRIPT = "systems/pixel_brain/tests/benchmark_brain_health.py"

def run_benchmark():
    """Run the brain health benchmark with current parameters."""
    # Note: In a real autoresearch loop, the agent modifies the constants above.
    # We pass them to the benchmark script or modify the engine directly.
    
    # For this demo, we'll simulate the effect of the parameters
    # since we want to show HOW it would work.
    
    cmd = [sys.executable, BENCHMARK_SCRIPT, "--threshold", str(SCAN_THRESHOLD), "--json"]
    result = subprocess.run(cmd, capture_output=True, text=True)
    
    if result.returncode != 0:
        return {"error": result.stderr}
        
    try:
        return json.loads(result.stdout)
    except:
        return {"error": "Failed to parse JSON"}

def main():
    print(f"🧠 Brain Optimizer Generation 1")
    print(f"Current Parameters: threshold={SCAN_THRESHOLD}, radius={HEAL_RADIUS_BASE}")
    
    metrics = run_benchmark()
    
    if "error" in metrics:
        print(f"❌ Error: {metrics['error']}")
        sys.exit(1)
        
    print(f"📈 Efficiency Score: {metrics['efficiency_score']:.4f}")
    print(f"📉 Entropy Reduction: {metrics['reduction_pct']:.2f}%")
    print(f"⏱️  Latency: {metrics['latency_ms']:.2f}ms")
    
    # Log for autoresearch tracking
    with open("brain_opt_log.csv", "a") as f:
        f.write(f"{SCAN_THRESHOLD},{HEAL_RADIUS_BASE},{metrics['efficiency_score']}\n")

if __name__ == "__main__":
    main()
