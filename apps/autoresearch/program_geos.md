# Geometry OS Autonomous Optimization Loop

This is an autonomous research loop designed to optimize Geometry OS performance.

## Goal
Achieve and maintain **60 FPS** on the infinite map compositor.

## The Metric: FPS
The primary goal is to improve the `fps_60_achievable` check within `systems/health/bootstrap_check.py`.
- **Target Value**: 60.0
- **Measurement**: The FPS value returned by the health check.

## Experimentation Loop

LOOP FOREVER:

1. **Observe**: Run `python3 systems/health/bootstrap_check.py` and extract the current FPS.
2. **Identify Bottleneck**: Analyze the code in `systems/infinite_map_rs/src/` to find potential performance optimizations (e.g., shader complexity, data copies, render logic).
3. **Hypothesize**: "If I [optimize shader/refactor data structure], the FPS will increase."
4. **Act**: Modify the relevant Rust (`.rs`) or shader (`.wgsl`) files.
5. **Verify**:
   - Run `cargo build --release --manifest-path systems/infinite_map_rs/Cargo.toml` to ensure the compositor still compiles.
   - Run `bootstrap_check.py` to measure the new FPS.
6. **Decide**:
   - **KEEP**: If FPS increased and all checks still pass.
   - **DISCARD**: If FPS decreased, stayed the same, or any check fails.
7. **Record**: Log commit, FPS, and description to `results_fps.tsv`.

## Constraints
- **No Regressions**: Any change that improves FPS but breaks another part of the bootstrap (i.e., causes another check to fail) must be discarded.
- **Stability**: The compositor must compile and run without panics.
