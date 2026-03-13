# Geometry OS Autonomous Optimization Loop

This is an autonomous research loop designed to optimize Geometry OS performance.

## Goal
Achieve and maintain **optimal GPU-native glyph memory allocation** for the Geometry OS font system.

## The Metric: Allocator Fitness
The primary goal is to improve the fitness score of the glyph allocator.
- **Target Value**: 0.9 (90% fitness)
- **Measurement**: The fitness score returned by the allocator's fitness function.

## Experimentation Loop

LOOP FOREVER:

1. **Observe**: Run the glyph allocator fitness test and extract the current fitness score.
2. **Identify Bottleneck**: Analyze the code in `systems/glyph_allocator/src/` to find potential performance optimizations (e.g., allocation algorithms, data structures, GPU memory patterns).
3. **Hypothesize**: "If I [optimize allocation algorithm/refactor data structure], the fitness score will increase."
4. **Act**: Modify the relevant Rust (`.rs`) files in the glyph allocator.
5. **Verify**:
    - Run `cargo test --manifest-path systems/glyph_allocator/Cargo.toml` to ensure the allocator still compiles and tests pass.
    - Run the fitness test to measure the new fitness score.
6. **Decide**:
    - **KEEP**: If fitness score increased and all checks still pass.
    - **DISCARD**: If fitness score decreased, stayed the same, or any check fails.
7. **Record**: Log commit, fitness score, and description to `results_fitness.tsv`.

## Constraints
- **No Regressions**: Any change that improves fitness but breaks another part of the allocator (i.e., causes tests to fail) must be discarded.
- **Stability**: The allocator must compile and run without panics.
- **GPU-Native**: Changes should align with GPU-native principles where applicable.