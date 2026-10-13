// Spatial Routing Benchmark Harness
// Measures performance of GeoASM spatial execution on GPU
use criterion::{black_box, criterion_group, criterion_main, BenchmarkId, Criterion};
use infinite_map_rs::geoasm_materializer::{parse_ascii_geoasm, GeoasmMaterializer, MaterializeRequest};
use infinite_map_rs::spatial::path_cache::PathCache;
use infinite_map_rs::spatial_grid::CellState;
use std::time::Duration;

const GRID_WIDTH: usize = 128;
const GRID_HEIGHT: usize = 64;

fn create_test_grid(n_instructions: usize) -> Vec<CellState> {
    let mut ascii_geoasm = String::new();

    // Place LDI instructions with DATA cells
    for i in 0..n_instructions.min(100) {
        let x = (i % 10) * 12;
        let y = ((i / 10) * 8).min(GRID_HEIGHT - 1);

        ascii_geoasm.push_str(&format!("DATA {} {} {}\n", x, y, i as f32));
        ascii_geoasm.push_str(&format!("LDI {} {} {} 0\n", x + 2, y, x + 1));
    }

    // Add WALL barriers to create isolation
    for i in 1..10 {
        ascii_geoasm.push_str(&format!("WALL {} {} 30\n", i * 12 - 1, 0));
    }

    // Add HALT
    ascii_geoasm.push_str("HALT 60 30\n");

    let cells = parse_ascii_geoasm(&ascii_geoasm).expect("Failed to parse GeoASM");
    let materializer = GeoasmMaterializer::new(GRID_WIDTH, GRID_HEIGHT);
    let req = MaterializeRequest {
        region_id: None,
        cells,
    };

    let result = materializer
        .materialize(&req)
        .expect("Failed to materialize");
    result
}

fn benchmark_path_cache_construction(c: &mut Criterion) {
    let mut group = c.benchmark_group("path_cache");

    let grid = create_test_grid(100);

    group.bench_function("cache_construction_128x64", |b| {
        b.iter(|| {
            let cache = PathCache::from_cells(&grid);
            black_box(cache);
        });
    });

    group.finish();
}

fn benchmark_cached_vs_uncached(c: &mut Criterion) {
    let mut group = c.benchmark_group("path_validation");

    group.measurement_time(Duration::from_secs(5));
    group.sample_size(20);

    let grid = create_test_grid(100);
    let cache = PathCache::from_cells(&grid);

    // Simulate path validation workload
    let test_paths = vec![
        (0, 0, 50, 30),
        (10, 10, 60, 30),
        (20, 20, 70, 40),
        (5, 5, 25, 15),
        (15, 15, 45, 25),
    ];

    group.bench_function("uncached_path_validation", |b| {
        b.iter(|| {
            for &(start_x, start_y, end_x, end_y) in &test_paths {
                // Naive implementation (uncached) - would iterate through intermediate cells
                let dx = (end_x as i32 - start_x as i32).abs();
                let dy = (end_y as i32 - start_y as i32).abs();
                let steps = dx + dy;
                black_box(steps);
            }
        });
    });

    group.bench_function("cached_path_validation", |b| {
        b.iter(|| {
            for &(start_x, start_y, end_x, end_y) in &test_paths {
                let _result = cache.path_clear(start_x, start_y, end_x, end_y);
                black_box(&_result);
            }
        });
    });

    group.finish();
}

fn benchmark_grid_creation(c: &mut Criterion) {
    let mut group = c.benchmark_group("grid_creation");

    for n in [10, 50, 100, 200].iter() {
        group.bench_with_input(BenchmarkId::new("create_grid", n), n, |b, &n| {
            b.iter(|| {
                let grid = create_test_grid(n);
                black_box(grid);
            });
        });
    }

    group.finish();
}

fn benchmark_materialization(c: &mut Criterion) {
    let mut group = c.benchmark_group("materialization");

    for n in [10, 50, 100].iter() {
        group.bench_with_input(BenchmarkId::new("materialize", n), n, |b, &n| {
            b.iter(|| {
                let mut ascii_geoasm = String::new();

                for i in 0..n {
                    let x = (i % 10) * 12;
                    let y = ((i / 10) * 8).min(GRID_HEIGHT - 1);
                    ascii_geoasm.push_str(&format!("DATA {} {} {}\n", x, y, i as f32));
                    ascii_geoasm.push_str(&format!("LDI {} {} {} 0\n", x + 2, y, x + 1));
                }

                ascii_geoasm.push_str("HALT 60 30\n");

                let cells = parse_ascii_geoasm(&ascii_geoasm).expect("Failed to parse GeoASM");
                let materializer = GeoasmMaterializer::new(GRID_WIDTH, GRID_HEIGHT);
                let req = MaterializeRequest {
                    region_id: None,
                    cells,
                };

                let result = materializer
                    .materialize(&req)
                    .expect("Failed to materialize");
                black_box(result);
            });
        });
    }

    group.finish();
}

fn configure_criterion() -> Criterion {
    Criterion::default()
        .warm_up_time(Duration::from_secs(1))
        .measurement_time(Duration::from_secs(3))
        .sample_size(10)
}

criterion_group! {
    name = benches;
    config = configure_criterion();
    targets =
        benchmark_grid_creation,
        benchmark_path_cache_construction,
        benchmark_cached_vs_uncached,
        benchmark_materialization
}

criterion_main!(benches);