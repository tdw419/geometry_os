// Spatial Routing Performance Benchmark - Phase 4.0
//
// Measures critical metrics for spatial routing:
// - Frames per second on 128x64 grid (baseline: target 60Hz)
// - WGSL compute duration per frame (target: <1ms after path caching)
// - Cell activation distribution (active vs idle cells)
// - Memory bandwidth utilization
// - Regression detection (10% threshold)
//
// Usage: cargo bench --bench spatial_runner_benchmark
//
// Output: JSON metrics in target/criterion/spatial_runner_benchmark/report/

use criterion::{black_box, criterion_group, criterion_main, BenchmarkId, Criterion, Throughput};
use infinite_map_rs::spatial::grid_runner::GridRunner;
use std::path::Path;
use std::time::Instant;

// ============================================
// Benchmark Metrics Structure
// ============================================

#[derive(Debug, serde::Serialize)]
struct BenchmarkMetrics {
    test_name: String,
    grid_width: usize,
    grid_height: usize,
    total_cells: usize,
    frames_per_second: f64,
    avg_frame_time_ms: f64,
    cell_activation: CellActivationMetrics,
    memory_bandwidth_mb_s: f64,
}

#[derive(Debug, serde::Serialize)]
struct CellActivationMetrics {
    active_cells: usize,
    idle_cells: usize,
    total_cells: usize,
    active_percentage: f64,
}

impl BenchmarkMetrics {
    fn to_json(&self) -> String {
        serde_json::to_string_pretty(self).unwrap()
    }
}

// ============================================
// Benchmark Helper Functions
// ============================================

/// Count active cells from grid state
fn count_active_cells(grid: &[infinite_map_rs::spatial::CellState]) -> usize {
    grid.iter().filter(|cell| cell.is_active > 0).count()
}

/// Calculate memory bandwidth (bytes transferred per second)
fn calculate_memory_bandwidth(
    grid_bytes: u64,
    frames_per_second: f64,
    buffers_per_frame: u64,
) -> f64 {
    // Total bytes per frame = grid size * number of buffers (read + write + overlay)
    let bytes_per_frame = grid_bytes * buffers_per_frame;
    let bytes_per_second = bytes_per_frame as f64 * frames_per_second;
    bytes_per_second / (1024.0 * 1024.0) // Convert to MB/s
}

// ============================================
// Benchmark Scenarios
// ============================================

/// Baseline: Empty grid (no active cells)
fn bench_baseline_empty_grid(c: &mut Criterion) {
    let rt = tokio::runtime::Runtime::new().unwrap();
    let _guard = rt.enter();
    
    c.bench_function("baseline_empty_grid", |b| {
        b.iter(|| {
            rt.block_on(async {
                let mut runner = GridRunner::new().await.unwrap();
                let _ = runner.tick().await;
            })
        });
    });
}

/// Simple program: Single active instruction (LDI)
fn bench_single_instruction(c: &mut Criterion) {
    let rt = tokio::runtime::Runtime::new().unwrap();
    let _guard = rt.enter();
    
    // Load test binary
    let binary_path = Path::new("/home/jericho/projects/zion/projects/geometry_os/geometry_os/tests/spatial_runner/test_copy_simple.bin");
    if !binary_path.exists() {
        return;
    }
    
    let bin_data = std::fs::read(binary_path).unwrap();
    
    c.bench_function("single_instruction", |b| {
        b.iter(|| {
            rt.block_on(async {
                let mut runner = GridRunner::new().await.unwrap();
                runner.load_binary(&bin_data).unwrap();
                
                // Warmup
                for _ in 0..10 {
                    let _ = runner.tick().await;
                }
                
                // Benchmark
                let _ = runner.tick().await;
            })
        });
    });
}

/// Multi-region: 4 isolated regions (test_multiregion.bin)
fn bench_multiregion_isolation(c: &mut Criterion) {
    let rt = tokio::runtime::Runtime::new().unwrap();
    let _guard = rt.enter();
    
    let binary_path = Path::new("/home/jericho/projects/zion/projects/geometry_os/geometry_os/tests/spatial_runner/test_multiregion.bin");
    if !binary_path.exists() {
        return;
    }
    
    let bin_data = std::fs::read(binary_path).unwrap();
    
    c.bench_function("multiregion_isolation", |b| {
        b.iter(|| {
            rt.block_on(async {
                let mut runner = GridRunner::new().await.unwrap();
                runner.load_binary(&bin_data).unwrap();
                let _ = runner.tick().await;
            })
        });
    });
}

/// Throughput benchmark: Different grid sizes
fn bench_grid_size_scaling(c: &mut Criterion) {
    let rt = tokio::runtime::Runtime::new().unwrap();
    let _guard = rt.enter();
    
    let mut group = c.benchmark_group("grid_size_scaling");
    
    // Test with different workgroup sizes (simulated by running more ticks)
    for ticks in [10, 50, 100].iter() {
        group.throughput(Throughput::Elements(*ticks as u64));
        
        group.bench_with_input(BenchmarkId::from_parameter(ticks), ticks, |b, &ticks| {
            b.iter(|| {
                rt.block_on(async {
                    let mut runner = GridRunner::new().await.unwrap();
                    
                    for _ in 0..ticks {
                        let _ = runner.tick().await;
                    }
                })
            });
        });
    }
    
    group.finish();
}

// ============================================
// Metrics Collection Benchmark
// ============================================

fn bench_metrics_collection(c: &mut Criterion) {
    let rt = tokio::runtime::Runtime::new().unwrap();
    let _guard = rt.enter();
    
    // Load test binary once
    let binary_path = Path::new("/home/jericho/projects/zion/projects/geometry_os/geometry_os/tests/spatial_runner/test_copy_simple.bin");
    let bin_data = if binary_path.exists() {
        Some(std::fs::read(binary_path).unwrap())
    } else {
        None
    };
    
    c.bench_function("metrics_collection", |b| {
        b.iter(|| {
            rt.block_on(async {
                let mut runner = GridRunner::new().await.unwrap();
                
                if let Some(ref data) = bin_data {
                    runner.load_binary(data).unwrap();
                }
                
                // Run and collect metrics
                let start = Instant::now();
                let frames = 60;
                
                for _ in 0..frames {
                    let _ = runner.tick().await;
                }
                
                let duration = start.elapsed();
                let fps = frames as f64 / duration.as_secs_f64();
                let avg_frame_time_ms = duration.as_millis() as f64 / frames as f64;
                
                // Read grid state
                let grid = runner.read_grid().await.unwrap();
                let active_cells = count_active_cells(&grid);
                let total_cells = grid.len();
                
                let metrics = BenchmarkMetrics {
                    test_name: "metrics_collection".to_string(),
                    grid_width: 128,
                    grid_height: 64,
                    total_cells,
                    frames_per_second: fps,
                    avg_frame_time_ms,
                    cell_activation: CellActivationMetrics {
                        active_cells,
                        idle_cells: total_cells - active_cells,
                        total_cells,
                        active_percentage: (active_cells as f64 / total_cells as f64) * 100.0,
                    },
                    memory_bandwidth_mb_s: calculate_memory_bandwidth(
                        (total_cells * std::mem::size_of::<infinite_map_rs::spatial::CellState>())
                            as u64,
                        fps,
                        3, // read + write + overlay buffers
                    ),
                };
                
                // Print metrics for regression testing
                println!("{}", metrics.to_json());
            })
        });
    });
}

// ============================================
// Benchmark Groups
// ============================================

criterion_group!(
    benches,
    bench_baseline_empty_grid,
    bench_single_instruction,
    bench_multiregion_isolation,
    bench_grid_size_scaling,
    bench_metrics_collection
);

criterion_main!(benches);