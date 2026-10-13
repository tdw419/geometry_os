// Simple CPU benchmark comparing iteration vs cached path validation
//
// This is a simplified version that doesn't require GPU initialization
// and can be run quickly to measure the speedup factor.

use infinite_map_rs::spatial::{CellState, PathCache, GRID_W, GRID_H, TOTAL_CELLS};
use std::time::Instant;

fn create_multiregion_grid() -> Vec<CellState> {
    let mut cells = vec![
        CellState {
            opcode_or_type: 0,
            is_active: 0,
            data_buffer: 0,
            executing: 0,
        };
        TOTAL_CELLS
    ];

    // Create 4 isolated regions separated by WALLs at x=10, 30, 50
    for y in 0..GRID_H {
        cells[y * GRID_W + 10].opcode_or_type = 1; // TYPE_WALL
        cells[y * GRID_W + 30].opcode_or_type = 1; // TYPE_WALL
        cells[y * GRID_W + 50].opcode_or_type = 1; // TYPE_WALL
    }

    cells
}

fn cpu_path_clear_iteration(cells: &[CellState], src_x: usize, src_y: usize, dst_x: usize, dst_y: usize) -> bool {
    let dx = if src_x > dst_x {
        src_x - dst_x
    } else {
        dst_x - src_x
    };
    let dy = if src_y > dst_y {
        src_y - dst_y
    } else {
        dst_y - src_y
    };

    if dx + dy <= 1 {
        return true;
    }

    let (y_min, y_max) = if src_y < dst_y {
        (src_y, dst_y)
    } else {
        (dst_y, src_y)
    };
    let (x_min, x_max) = if src_x < dst_x {
        (src_x, dst_x)
    } else {
        (dst_x, src_x)
    };

    // Vertical check
    if src_y != dst_y {
        for y in (y_min + 1)..y_max {
            let cell = &cells[y * GRID_W + src_x];
            if cell.opcode_or_type == 1 {
                // TYPE_WALL
                return false;
            }
        }
    }

    // Horizontal check
    if src_x != dst_x {
        for x in (x_min + 1)..x_max {
            let cell = &cells[dst_y * GRID_W + x];
            if cell.opcode_or_type == 1 {
                // TYPE_WALL
                return false;
            }
        }
    }

    true
}

fn main() {
    println!("=== Path Cache Performance Comparison ===");
    println!("Grid: {}x{} ({} cells)", GRID_W, GRID_H, TOTAL_CELLS);
    println!();

    let cells = create_multiregion_grid();
    let cache = PathCache::from_cells(&cells);

    // Benchmark parameters
    const ITERATIONS: usize = 100;
    const SEARCH_RADIUS: usize = 50;  // Longer paths for better speedup visibility

    // Calculate iterations to avoid overflow
    let paths_per_iter: u64 = (SEARCH_RADIUS * SEARCH_RADIUS * SEARCH_RADIUS * SEARCH_RADIUS / 4) as u64;
    let safe_iterations = std::cmp::min(ITERATIONS, (u64::MAX / paths_per_iter) as usize);
    println!("Using {} iterations ({} paths per iteration)", safe_iterations, paths_per_iter);

    // Warmup
    for _ in 0..1000 {
        let _ = cpu_path_clear_iteration(&cells, 0, 0, 10, 10);
        let _ = cache.path_clear(0, 0, 10, 10);
    }

    // Benchmark v5: iteration-based
    let start = Instant::now();
    let mut v5_cleared: u64 = 0;
    for _ in 0..safe_iterations {
        for src_y in 0..GRID_H.min(SEARCH_RADIUS) {
            for src_x in 0..GRID_W.min(SEARCH_RADIUS) {
                for dst_y in 0..GRID_H.min(src_y + SEARCH_RADIUS) {
                    for dst_x in 0..GRID_W.min(src_x + SEARCH_RADIUS) {
                        if cpu_path_clear_iteration(&cells, src_x, src_y, dst_x, dst_y) {
                            v5_cleared += 1;
                        }
                    }
                }
            }
        }
    }
    let v5_duration = start.elapsed();
    let v5_avg_ns = v5_duration.as_nanos() as f64 / v5_cleared as f64;

    // Benchmark v6: cached lookup
    let start = Instant::now();
    let mut v6_cleared: u64 = 0;
    for _ in 0..safe_iterations {
        for src_y in 0..GRID_H.min(SEARCH_RADIUS) {
            for src_x in 0..GRID_W.min(SEARCH_RADIUS) {
                for dst_y in 0..GRID_H.min(src_y + SEARCH_RADIUS) {
                    for dst_x in 0..GRID_W.min(src_x + SEARCH_RADIUS) {
                        if cache.path_clear(src_x, src_y, dst_x, dst_y) {
                            v6_cleared += 1;
                        }
                    }
                }
            }
        }
    }
    let v6_duration = start.elapsed();
    let v6_avg_ns = v6_duration.as_nanos() as f64 / v6_cleared as f64;

    // Results
    println!("=== Results ===");
    println!("Paths validated: {}", v5_cleared);
    println!();
    println!("v5 (iteration-based):");
    println!("  Total time: {:?}", v5_duration);
    println!("  Avg time per path: {:.2} ns", v5_avg_ns);
    println!();
    println!("v6 (segment-cached):");
    println!("  Total time: {:?}", v6_duration);
    println!("  Avg time per path: {:.2} ns", v6_avg_ns);
    println!();
    let speedup = v5_avg_ns / v6_avg_ns;
    println!("=== Speedup: {:.2}x ===", speedup);
    println!();

    // Cache construction time
    let start = Instant::now();
    let _cache = PathCache::from_cells(&cells);
    let construction_time = start.elapsed();
    println!("Cache construction time: {:?}", construction_time);
    println!();

    // Memory footprint
    let horiz_data = cache.get_horiz_segments_gpu();
    let vert_data = cache.get_vert_segments_gpu();
    let horiz_counts = cache.get_horiz_counts();
    let vert_counts = cache.get_vert_counts();

    let total_bytes = (horiz_data.len() + vert_data.len()) * 4 + (horiz_counts.len() + vert_counts.len()) * 4;
    println!("GPU memory footprint: {:.2} KB", total_bytes as f64 / 1024.0);
    println!("  Horizontal segments: {} entries ({} KB)", horiz_data.len(), horiz_data.len() * 4 / 1024);
    println!("  Vertical segments: {} entries ({} KB)", vert_data.len(), vert_data.len() * 4 / 1024);
    println!("  Segment counts: {} entries ({} KB)", horiz_counts.len() + vert_counts.len(), (horiz_counts.len() + vert_counts.len()) * 4 / 1024);
}