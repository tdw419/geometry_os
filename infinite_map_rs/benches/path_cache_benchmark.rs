// Spatial Routing Path Cache Benchmark - Phase 4.2
//
// Compares v5 (original iteration-based) vs v6 (path-cached) performance
// Measures speedup from O(N) path validation to O(1) segment lookup
//
// Usage: cargo bench --bench path_cache_benchmark
//
// Output: JSON metrics showing speedup factor

use criterion::{black_box, criterion_group, criterion_main, BenchmarkId, Criterion, Throughput};
use infinite_map_rs::spatial::{CellState, PathCache, grid_runner::GridRunner, GRID_W, GRID_H, TOTAL_CELLS};
use std::path::Path;
use std::time::Instant;

const GRID_BYTES: u64 = (TOTAL_CELLS * std::mem::size_of::<CellState>()) as u64;

#[derive(Debug, serde::Serialize)]
struct PathCacheMetrics {
    test_name: String,
    grid_width: usize,
    grid_height: usize,
    total_cells: usize,
    v5_avg_frame_time_ms: f64,
    v6_avg_frame_time_ms: f64,
    speedup_factor: f64,
    frames_per_second_v5: f64,
    frames_per_second_v6: f64,
}

impl PathCacheMetrics {
    fn to_json(&self) -> String {
        serde_json::to_string_pretty(self).unwrap()
    }
}

/// Helper: create a multi-region test grid with WALLs
fn create_multiregion_grid() -> Vec<CellState> {
    let mut cells = vec![CellState {
        opcode_or_type: 0,
        is_active: 0,
        data_buffer: 0,
        executing: 0,
    }; TOTAL_CELLS];

    // Create 4 isolated regions separated by WALLs
    // Region A: x=0-9, Region B: x=11-29, Region C: x=31-49, Region D: x=51-127

    // Vertical WALLs at x=10, 30, 50
    for y in 0..GRID_H {
        cells[y * GRID_W + 10].opcode_or_type = 1;  // TYPE_WALL
        cells[y * GRID_W + 30].opcode_or_type = 1;  // TYPE_WALL
        cells[y * GRID_W + 50].opcode_or_type = 1;  // TYPE_WALL
    }

    // Add some active instructions in each region
    // Region A: LDI at (2,1) writing to (0,0)
    let mut setup_simple_program = |base_x: usize, base_y: usize| {
        // DATA cell with value 100
        cells[base_y * GRID_W + (base_x + 1)].opcode_or_type = 0;
        cells[base_y * GRID_W + (base_x + 1)].data_buffer = 100;

        // LDI instruction
        cells[base_y * GRID_W + base_x].opcode_or_type = 3;  // TYPE_LDI
        cells[base_y * GRID_W + base_x].is_active = 1;
        cells[base_y * GRID_W + base_x].executing = 1;
        // Pack rel_x=-2, rel_y=-1 into opcode_or_type
        cells[base_y * GRID_W + base_x].opcode_or_type |= (2048 & 0xFFF) << 8;  // rel_x = -2 (2048 as u12 signed)
        cells[base_y * GRID_W + base_x].opcode_or_type |= (4096 & 0xFFF) << 20; // rel_y = -1
    };

    setup_simple_program(2, 1);   // Region A
    setup_simple_program(12, 1);  // Region B
    setup_simple_program(32, 1);  // Region C
    setup_simple_program(52, 1);  // Region D

    cells
}

/// CPU-side path validation (simulates v5 iteration)
fn cpu_path_clear_iteration(cells: &[CellState], src_x: usize, src_y: usize, dst_x: usize, dst_y: usize) -> bool {
    let dx = if src_x > dst_x { src_x - dst_x } else { dst_x - src_x };
    let dy = if src_y > dst_y { src_y - dst_y } else { dst_y - src_y };

    if dx + dy <= 1 {
        return true;
    }

    let (y_min, y_max) = if src_y < dst_y { (src_y, dst_y) } else { (dst_y, src_y) };
    let (x_min, x_max) = if src_x < dst_x { (src_x, dst_x) } else { (dst_x, src_x) };

    // Vertical check
    if src_y != dst_y {
        for y in y_min + 1..y_max {
            let cell = &cells[y * GRID_W + src_x];
            if cell.opcode_or_type == 1 {  // TYPE_WALL
                return false;
            }
        }
    }

    // Horizontal check
    if src_x != dst_x {
        for x in x_min + 1..x_max {
            let cell = &cells[dst_y * GRID_W + x];
            if cell.opcode_or_type == 1 {  // TYPE_WALL
                return false;
            }
        }
    }

    true
}

/// Benchmark: CPU path validation iteration (v5 simulation)
fn bench_cpu_path_iteration(c: &mut Criterion) {
    let cells = create_multiregion_grid();

    let mut group = c.benchmark_group("v5_iteration");
    group.throughput(Throughput::Elements(cells.len() as u64));

    group.bench_function("path_clear_iter", |b| {
        b.iter(|| {
            // Simulate checking all possible paths
            let mut cleared = 0usize;
            for src_y in 0..GRID_H {
                for src_x in 0..GRID_W {
                    for dst_y in 0..GRID_H.min(src_y + 10) {
                        for dst_x in 0..GRID_W.min(src_x + 10) {
                            if cpu_path_clear_iteration(black_box(&cells), src_x, src_y, dst_x, dst_y) {
                                cleared += 1;
                            }
                        }
                    }
                }
            }
            black_box(cleared)
        })
    });

    group.finish();
}

/// Benchmark: Path cache lookup (v6)
fn bench_path_cache_lookup(c: &mut Criterion) {
    let cells = create_multiregion_grid();
    let cache = PathCache::from_cells(&cells);

    let mut group = c.benchmark_group("v6_cache_lookup");
    group.throughput(Throughput::Elements(cells.len() as u64));

    group.bench_function("path_clear_cache", |b| {
        b.iter(|| {
            let mut cleared = 0usize;
            for src_y in 0..GRID_H {
                for src_x in 0..GRID_W {
                    for dst_y in 0..GRID_H.min(src_y + 10) {
                        for dst_x in 0..GRID_W.min(src_x + 10) {
                            if cache.path_clear(black_box(src_x), black_box(src_y), black_box(dst_x), black_box(dst_y)) {
                                cleared += 1;
                            }
                        }
                    }
                }
            }
            black_box(cleared)
        })
    });

    group.finish();
}

/// Benchmark: Full GPU tick comparison
fn bench_gpu_tick_comparison(c: &mut Criterion) {
    let mut group = c.benchmark_group("gpu_tick_comparison");

    // v5: Load with original shader
    let binary_path = Path::new("tests/spatial_runner/test_multiregion.bin");
    if !binary_path.exists() {
        println!("Skipping GPU comparison: test_multiregion.bin not found");
        group.finish();
        return;
    }

    let rt = tokio::runtime::Runtime::new().unwrap();

    // Pre-allocate and load
    let mut runner = rt.block_on(GridRunner::new()).unwrap();
    let bin_data = std::fs::read(binary_path).unwrap();
    runner.load_binary(&bin_data).unwrap();

    group.bench_function("v6_path_cached_shader", |b| {
        b.iter(|| {
            rt.block_on(async {
                black_box(runner.tick().await.unwrap())
            })
        })
    });

    group.finish();
}

/// Path cache construction benchmark
fn bench_path_cache_construction(c: &mut Criterion) {
    let mut group = c.benchmark_group("cache_construction");

    for size in [64, 128, 256] {
        let grid_w = size;
        let grid_h = size / 2;

        group.bench_with_input(
            BenchmarkId::new("build_cache", size),
            &(grid_w, grid_h),
            |b, &(w, h)| {
                let mut cells = vec![
                    CellState {
                        opcode_or_type: 0,
                        is_active: 0,
                        data_buffer: 0,
                        executing: 0,
                    };
                    w * h
                ];

                // Add some WALLs
                for y in 0..h {
                    cells[y * w + w / 4].opcode_or_type = 1;
                    cells[y * w + w / 2].opcode_or_type = 1;
                    cells[y * w + 3 * w / 4].opcode_or_type = 1;
                }

                b.iter(|| {
                    black_box(PathCache::from_cells(black_box(&cells)))
                })
            }
        );
    }

    group.finish();
}

criterion_group!(
    benches,
    bench_cpu_path_iteration,
    bench_path_cache_lookup,
    bench_path_cache_construction,
    bench_gpu_tick_comparison
);

criterion_main!(benches);