#!/usr/bin/env python3
"""
Geometry OS Font Performance Researcher
Autonomous loop to optimize MSDF font shaders for 60 FPS.
"""

import subprocess
import time
import re
import os
import sys

SHADER_PATH = "systems/infinite_map_rs/src/shaders/msdf_font.wgsl"
COMPOSITOR_CMD = ["xvfb-run", "-a", "cargo", "run", "--release", "--manifest-path", "systems/infinite_map_rs/Cargo.toml", "--bin", "infinite_map_rs", "--", "--benchmark-text"]

def get_current_fps(duration=15):
    """Run the compositor and extract average FPS from logs."""
    env = os.environ.copy()
    env["RUST_LOG"] = "info"
    
    print(f"🚀 Launching benchmark (duration={duration}s)...")
    process = subprocess.Popen(COMPOSITOR_CMD, stdout=subprocess.PIPE, stderr=subprocess.STDOUT, text=True, env=env)
    
    fps_values = []
    start_time = time.time()
    
    try:
        while time.time() - start_time < duration:
            line = process.stdout.readline()
            if not line:
                break
            
            # Look for "Perf: X.X FPS"
            match = re.search(r"Perf: ([\d.]+) FPS", line)
            if match:
                fps = float(match.group(1))
                fps_values.append(fps)
                print(f"  [Metric] {fps} FPS")
    except KeyboardInterrupt:
        print("Stopping benchmark...")
    finally:
        process.terminate()
        try:
            process.wait(timeout=5)
        except subprocess.TimeoutExpired:
            process.kill()
        
    if not fps_values:
        print("⚠️ No FPS data collected.")
        return 0.0
    
    # Skip first 5 samples (startup lag/compilation)
    samples = fps_values[5:] if len(fps_values) > 5 else fps_values
    if not samples:
        return 0.0
        
    avg_fps = sum(samples) / len(samples)
    print(f"📊 Average FPS: {avg_fps:.2f}")
    return avg_fps

def apply_optimization(name, shader_content):
    """Apply a specific shader optimization."""
    if name == "remove_discard":
        # Replacing discard with transparent return can sometimes be faster depending on GPU
        return shader_content.replace("discard;", "return vec4<f32>(0.0, 0.0, 0.0, 0.0);")
    elif name == "simplify_median":
        # Simplified median if channels are similar (risky)
        return shader_content.replace(
            "return max(min(msdf.r, msdf.g), min(max(msdf.r, msdf.g), msdf.b));",
            "return (msdf.r + msdf.g + msdf.b) / 3.0;"
        )
    return shader_content

def main():
    print("=== Geometry OS Font Performance Researcher ===")
    
    # 1. Baseline
    baseline_fps = get_current_fps()
    print(f"Initial Baseline: {baseline_fps:.2f} FPS")
    
    if baseline_fps == 0:
        print("Error: Could not establish baseline. Ensure compositor builds and runs.")
        sys.exit(1)
        
    best_fps = baseline_fps
    
    # 2. Try Optimizations
    with open(SHADER_PATH, "r") as f:
        original_shader = f.read()
        
    optimizations = ["remove_discard", "simplify_median"]
    
    for opt in optimizations:
        print(f"\nTesting optimization: {opt}")
        optimized_shader = apply_optimization(opt, original_shader)
        
        with open(SHADER_PATH, "w") as f:
            f.write(optimized_shader)
            
        time.sleep(1) # Wait for hot-reload if running, but we restart here
        
        current_fps = get_current_fps()
        
        if current_fps > best_fps:
            print(f"✅ Improvement detected! {best_fps:.2f} -> {current_fps:.2f}")
            best_fps = current_fps
            # Keep the change
        else:
            print(f"❌ Regression or no improvement. Reverting.")
            with open(SHADER_PATH, "w") as f:
                f.write(original_shader)

    print("\n=== Research Complete ===")
    print(f"Final FPS: {best_fps:.2f}")
    print(f"Improvement: {((best_fps - baseline_fps) / baseline_fps * 100):.1f}%")

if __name__ == "__main__":
    main()
