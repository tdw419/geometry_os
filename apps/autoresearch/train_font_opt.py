#!/usr/bin/env python3
"""
Geometry OS Terminal Performance Researcher
Autonomous loop to optimize terminal_renderer.wgsl for 60 FPS.
"""

import subprocess
import time
import re
import os
import sys

SHADER_PATH = "systems/infinite_map_rs/src/shaders/terminal_renderer.wgsl"
BINARY_PATH = "/home/jericho/zion/projects/geometry_os/geometry_os/systems/infinite_map_rs/target/release/infinite_map_rs"
COMPOSITOR_CMD = ["xvfb-run", "-a", BINARY_PATH, "--benchmark-text"]

def get_current_fps(duration=30):
    """Run the compositor and extract average FPS from logs."""
    env = os.environ.copy()
    env["RUST_LOG"] = "info"
    env["PYTHONUNBUFFERED"] = "1"
    
    print(f"🚀 Launching benchmark (duration={duration}s)...")
    # Use stdbuf to disable buffering if possible
    cmd = ["stdbuf", "-oL", "-eL"] + COMPOSITOR_CMD
    
    process = subprocess.Popen(cmd, stdout=subprocess.PIPE, stderr=subprocess.STDOUT, text=True, env=env, bufsize=1)
    
    fps_values = []
    start_time = time.time()
    
    try:
        # Set a reasonable timeout for each line to avoid hanging forever
        import selectors
        selector = selectors.DefaultSelector()
        selector.register(process.stdout, selectors.EVENT_READ)
        
        while time.time() - start_time < duration:
            events = selector.select(timeout=1.0)
            if not events:
                if process.poll() is not None: break
                continue
                
            line = process.stdout.readline()
            if not line:
                break
            
            # Debug: print every log line to see what's happening
            print(f"  [Log] {line.strip()}")
            
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
    """Apply a specific terminal shader optimization."""
    if name == "lift_d2xy":
        # Lift Hilbert calculation outside the per-pixel logic (MAJOR GAIN)
        # This replaces the per-pixel d2xy call with a more efficient lookup if we can, 
        # or simply optimizes the existing structure.
        # Here we just optimize the d2xy loop slightly as a first pass.
        return shader_content.replace(
            "let rx = 1u & (d / 2u);",
            "let rx = (d >> 1u) & 1u;"
        ).replace(
            "d /= 4u;",
            "d >>= 2u;"
        )
    elif name == "branchless_cursor":
        # Remove if for cursor
        return shader_content.replace(
            """    var is_at_cursor = (cell_x == uniforms.cursor_x && cell_y == uniforms.cursor_y);
    if (is_at_cursor && uniforms.cursor_visible != 0u) {
        // Simple invert cursor for now
        let temp = fg;
        fg = bg;
        bg = temp;
    }""",
            """    let is_at_cursor = u32(cell_x == uniforms.cursor_x && cell_y == uniforms.cursor_y && uniforms.cursor_visible != 0u);
    let final_fg = mix(fg, bg, f32(is_at_cursor));
    let final_bg = mix(bg, fg, f32(is_at_cursor));
    fg = final_fg;
    bg = final_bg;"""
        )
    return shader_content

def main():
    print("=== Geometry OS Terminal Performance Researcher ===")
    
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
        
    optimizations = ["lift_d2xy", "branchless_cursor"]
    
    for opt in optimizations:
        print(f"\nTesting optimization: {opt}")
        optimized_shader = apply_optimization(opt, original_shader)
        
        with open(SHADER_PATH, "w") as f:
            f.write(optimized_shader)
            
        time.sleep(1) 
        
        current_fps = get_current_fps()
        
        if current_fps > best_fps * 1.01: # 1% threshold
            print(f"✅ Improvement detected! {best_fps:.2f} -> {current_fps:.2f}")
            best_fps = current_fps
            original_shader = optimized_shader # Base further opts on this
        else:
            print(f"❌ Regression or no improvement. Reverting.")
            with open(SHADER_PATH, "w") as f:
                f.write(original_shader)

    print("\n=== Research Complete ===")
    print(f"Final FPS: {best_fps:.2f}")
    if baseline_fps > 0:
        print(f"Improvement: {((best_fps - baseline_fps) / baseline_fps * 100):.1f}%")

if __name__ == "__main__":
    main()
