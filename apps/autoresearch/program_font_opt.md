# Geometry OS Font Performance Research Loop

Target: 60 FPS during text-heavy scenarios.

## Metrics
- **FPS**: Measured via `log::info!` output from `infinite_map_rs`.
- **Text Load**: Render a grid of 80x40 characters in the `TextEngine`.

## Experimentation Steps
1. **Benchmark**: Run `cargo run --release` with a pre-filled text buffer.
2. **Observe**: Parse the `Perf: X.X FPS` log.
3. **Hypothesize**: Modify `msdf_font.wgsl` or `font_atlas.rs` for performance.
4. **Act**: Apply the change.
5. **Verify**: Run the benchmark again.
6. **Decide**: Keep if FPS > Previous and no regressions.

## Candidate Optimizations
- **Shader Branching**: Reduce `discard` or `if` statements in `msdf_font.wgsl`.
- **Atlas Packing**: Improve packing density to reduce texture size.
- **Sampling**: Optimize `textureSample` and `median` calculations.
- **Buffer Updates**: Batch `write_buffer` calls or use a staging buffer.
