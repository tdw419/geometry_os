fn main() {
    // Test actual fitness values
    let circuits = [
        ("sparse", 102, 1000),   // 10% of 1024
        ("medium", 256, 1000),  // 25% of 1024
        ("dense", 512, 1000),   // 50% of 1024
        ("full", 1024, 1000),   // 100% of 1024
    ];

    for (name, active_cells, total_cells) in circuits {
        let spatial_density = active_cells as f32 / total_cells as f32;
        let complexity = active_cells as f32 * 0.5; // microseconds per cell
        let avg_tick_us = complexity;
        let fps = if avg_tick_us > 0.0 {
            1_000_000.0 / avg_tick_us
        } else {
            0.0
        };
        let throughput = spatial_density * total_cells as f32;
        let grid_size_factor = (total_cells as f32).log10().max(1.0);
        let normalized_fps = (fps.min(60.0) / 60.0) * 100.0;
        let normalized_throughput = (throughput / grid_size_factor).min(100.0);

        // Fixed weights
        let fitness_score = (normalized_fps * 0.2)
            + (normalized_throughput * 0.3)
            + (spatial_density * 100.0 * 0.4)
            + (1.0 * 100.0 * 0.1);

        println!("{}: active={}, density={:.3}, fps={:.2}, n_fps={:.2}, thr={:.2}, n_thr={:.2}, fitness={:.2}",
                 name, active_cells, spatial_density, fps, normalized_fps, throughput, normalized_throughput, fitness_score);
    }
}