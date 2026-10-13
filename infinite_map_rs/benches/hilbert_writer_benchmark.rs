// Hilbert Writer Performance Benchmark
//
// Validates Hilbert curve weight mutation performance:
// - Coordinate transformation: < 50ns per coordinate
// - Batch processing: < 10ns per coordinate (amortized)
// - Cache hit rate: > 80% for sequential access
// - Write queue throughput: > 1M mutations/second

use criterion::{black_box, criterion_group, criterion_main, BenchmarkId, Criterion, Throughput};
use std::collections::HashMap;

/// Hilbert coordinate - SIMD-friendly layout (8 bytes total)
#[derive(Debug, Clone, Copy, Default, PartialEq, Eq, Hash)]
#[repr(C, align(8))]
pub struct HilbertCoord {
    pub x: u32,
    pub y: u32,
}

/// Batch of Hilbert coordinates for SIMD processing
#[derive(Debug, Clone, Default)]
#[repr(C, align(32))]
pub struct HilbertCoordBatch {
    coords: [HilbertCoord; 8],
    len: usize,
}

impl HilbertCoordBatch {
    pub fn new() -> Self {
        Self {
            coords: [HilbertCoord::default(); 8],
            len: 0,
        }
    }

    pub fn push(&mut self, coord: HilbertCoord) {
        if self.len < 8 {
            self.coords[self.len] = coord;
            self.len += 1;
        }
    }

    pub fn is_full(&self) -> bool {
        self.len == 8
    }

    pub fn clear(&mut self) {
        self.len = 0;
    }

    pub fn as_slice(&self) -> &[HilbertCoord] {
        &self.coords[..self.len]
    }
}

/// Weight mutation record
#[derive(Debug, Clone)]
pub struct WeightMutation {
    pub index_1d: u32,
    pub weight_delta: f32,
}

/// Hilbert writer with LRU cache for benchmarking
pub struct HilbertWriter {
    atlas_size: u32,
    order: u32,
    pending_writes: Vec<(u32, u32, f32)>,
    coord_cache: HashMap<u32, HilbertCoord>,
    cache_access: std::collections::VecDeque<u32>,
    max_cache_size: usize,
    cache_hits: u64,
    cache_misses: u64,
}

impl HilbertWriter {
    pub fn new(atlas_size: u32) -> Self {
        let order = (atlas_size as f64).log2() as u32;
        Self {
            atlas_size,
            order,
            pending_writes: Vec::new(),
            coord_cache: HashMap::with_capacity(1024),
            cache_access: std::collections::VecDeque::with_capacity(1024),
            max_cache_size: 1024,
            cache_hits: 0,
            cache_misses: 0,
        }
    }

    /// Convert 1D index to 2D Hilbert coordinates using cached lookup
    pub fn index_to_coord(&mut self, index: u32) -> HilbertCoord {
        // Check cache
        if let Some(&coord) = self.coord_cache.get(&index) {
            self.cache_hits += 1;
            // Update LRU
            self.cache_access.retain(|&i| i != index);
            self.cache_access.push_back(index);
            return coord;
        }

        self.cache_misses += 1;

        // Compute Hilbert coordinates
        let (x, y) = hilbert_d2xy(self.order, index);
        let coord = HilbertCoord { x, y };

        // Cache it
        if self.coord_cache.len() >= self.max_cache_size {
            // Evict LRU
            if let Some(lru_index) = self.cache_access.pop_front() {
                self.coord_cache.remove(&lru_index);
            }
        }
        self.coord_cache.insert(index, coord);
        self.cache_access.push_back(index);

        coord
    }

    /// Queue a weight mutation
    pub fn queue_mutation(&mut self, mutation: &WeightMutation) {
        let coord = self.index_to_coord(mutation.index_1d);
        self.pending_writes.push((coord.x, coord.y, mutation.weight_delta));
    }

    /// Process batch of mutations
    pub fn queue_mutations_batch(&mut self, mutations: &[WeightMutation]) {
        for mutation in mutations {
            self.queue_mutation(mutation);
        }
    }

    /// Get pending writes and clear queue
    pub fn drain_pending(&mut self) -> Vec<(u32, u32, f32)> {
        std::mem::take(&mut self.pending_writes)
    }

    /// Get cache statistics
    pub fn cache_stats(&self) -> (u64, u64, f64) {
        let total = self.cache_hits + self.cache_misses;
        let hit_rate = if total > 0 {
            self.cache_hits as f64 / total as f64
        } else {
            0.0
        };
        (self.cache_hits, self.cache_misses, hit_rate)
    }

    /// Reset statistics
    pub fn reset_stats(&mut self) {
        self.cache_hits = 0;
        self.cache_misses = 0;
    }
}

/// Hilbert curve: convert distance to (x, y) coordinates
fn hilbert_d2xy(order: u32, d: u32) -> (u32, u32) {
    let mut x: u32 = 0;
    let mut y: u32 = 0;
    let mut s: u32 = 1;
    let mut d = d;

    for _ in 0..order {
        let rx = 1 & (d / 2);
        let ry = 1 & (d ^ rx);
        rot(s, &mut x, &mut y, rx, ry);
        x += s * rx;
        y += s * ry;
        d /= 4;
        s *= 2;
    }
    (x, y)
}

/// Hilbert curve: convert (x, y) coordinates to distance
fn hilbert_xy2d(order: u32, x: u32, y: u32) -> u32 {
    let mut d: u32 = 0;
    let mut s: u32 = 1 << (order - 1);
    let mut x = x;
    let mut y = y;

    while s > 0 {
        let rx = if (x & s) != 0 { 1 } else { 0 };
        let ry = if (y & s) != 0 { 1 } else { 0 };
        d += s * s * ((3 * rx) ^ ry);
        rot(s, &mut x, &mut y, rx, ry);
        s /= 2;
    }
    d
}

fn rot(n: u32, x: &mut u32, y: &mut u32, rx: u32, ry: u32) {
    if ry == 0 {
        if rx == 1 {
            *x = n - 1 - *x;
            *y = n - 1 - *y;
        }
        std::mem::swap(x, y);
    }
}

// ============================================
// Benchmarks
// ============================================

/// Benchmark single coordinate transformation (no cache)
fn bench_hilbert_transform(c: &mut Criterion) {
    let mut group = c.benchmark_group("hilbert_transform");

    let order = 8u32; // 256x256 grid

    group.throughput(Throughput::Elements(1000));
    group.bench_function("d2xy_1000", |b| {
        b.iter(|| {
            let mut coords = Vec::with_capacity(1000);
            for i in 0..1000u32 {
                let (x, y) = hilbert_d2xy(order, i);
                coords.push((x, y));
            }
            black_box(coords);
        });
    });

    group.bench_function("xy2d_1000", |b| {
        b.iter(|| {
            let mut indices = Vec::with_capacity(1000);
            for i in 0..1000u32 {
                let x = i % 256;
                let y = i / 256;
                let d = hilbert_xy2d(order, x, y);
                indices.push(d);
            }
            black_box(indices);
        });
    });

    group.bench_function("roundtrip_1000", |b| {
        b.iter(|| {
            let mut sum = 0u64;
            for i in 0..1000u32 {
                let (x, y) = hilbert_d2xy(order, i);
                let d = hilbert_xy2d(order, x, y);
                sum += d as u64;
            }
            black_box(sum);
        });
    });

    group.finish();
}

/// Benchmark cached coordinate lookup
fn bench_cached_lookup(c: &mut Criterion) {
    let mut group = c.benchmark_group("hilbert_cached");

    let atlas_size = 256u32;

    // Sequential access (high cache hit rate)
    group.bench_function("sequential_10k", |b| {
        let mut writer = HilbertWriter::new(atlas_size);
        // Warm up cache
        for i in 0..100 {
            writer.index_to_coord(i);
        }
        writer.reset_stats();

        b.iter(|| {
            for i in 0..10000u32 {
                let coord = writer.index_to_coord(i % 200);
                black_box(coord);
            }
        });

        let (hits, misses, rate) = writer.cache_stats();
        println!("Sequential cache stats: hits={}, misses={}, rate={:.2}%", hits, misses, rate * 100.0);
    });

    // Random access (lower cache hit rate)
    group.bench_function("random_10k", |b| {
        let mut writer = HilbertWriter::new(atlas_size);
        let indices: Vec<u32> = (0..10000).map(|i| (i * 7919) % 65536).collect();

        b.iter(|| {
            for &idx in &indices {
                let coord = writer.index_to_coord(idx);
                black_box(coord);
            }
        });

        let (hits, misses, rate) = writer.cache_stats();
        println!("Random cache stats: hits={}, misses={}, rate={:.2}%", hits, misses, rate * 100.0);
    });

    // Working set access (simulates neural weight access patterns)
    group.bench_function("working_set_10k", |b| {
        let mut writer = HilbertWriter::new(atlas_size);
        // Neural weights tend to cluster
        let indices: Vec<u32> = (0..10000)
            .map(|i| {
                let cluster = (i / 100) * 100;
                let offset = (i % 100) % 10;
                cluster + offset
            })
            .collect();

        b.iter(|| {
            for &idx in &indices {
                let coord = writer.index_to_coord(idx);
                black_box(coord);
            }
        });

        let (hits, misses, rate) = writer.cache_stats();
        println!("Working set cache stats: hits={}, misses={}, rate={:.2}%", hits, misses, rate * 100.0);
    });

    group.finish();
}

/// Benchmark batch processing
fn bench_batch_processing(c: &mut Criterion) {
    let mut group = c.benchmark_group("hilbert_batch");

    let atlas_size = 256u32;
    let mut writer = HilbertWriter::new(atlas_size);

    for &batch_size in &[100, 1000, 10000] {
        group.throughput(Throughput::Elements(batch_size as u64));

        // Generate mutations
        let mutations: Vec<WeightMutation> = (0..batch_size)
            .map(|i| WeightMutation {
                index_1d: (i * 7) % 65536, // Pseudo-random distribution
                weight_delta: (i as f32) * 0.001,
            })
            .collect();

        group.bench_with_input(
            BenchmarkId::new("process", batch_size),
            &mutations,
            |b, mutations| {
                b.iter(|| {
                    writer.queue_mutations_batch(mutations);
                    let writes = writer.drain_pending();
                    black_box(writes);
                });
            },
        );
    }

    group.finish();
}

/// Benchmark write queue operations
fn bench_write_queue(c: &mut Criterion) {
    let mut group = c.benchmark_group("hilbert_queue");

    let atlas_size = 256u32;

    group.bench_function("push_10k", |b| {
        let mut writer = HilbertWriter::new(atlas_size);
        let mutations: Vec<WeightMutation> = (0..10000)
            .map(|i| WeightMutation {
                index_1d: i,
                weight_delta: 0.1,
            })
            .collect();

        b.iter(|| {
            writer.pending_writes.clear();
            for m in &mutations {
                writer.queue_mutation(m);
            }
            black_box(&writer.pending_writes);
        });
    });

    group.bench_function("drain_10k", |b| {
        let mut writer = HilbertWriter::new(atlas_size);
        for i in 0..10000 {
            writer.pending_writes.push((i % 256, i / 256, 0.1));
        }

        b.iter(|| {
            let writes = writer.drain_pending();
            black_box(writes);
            // Refill for next iteration
            for i in 0..10000 {
                writer.pending_writes.push((i % 256, i / 256, 0.1));
            }
        });
    });

    group.finish();
}

/// Benchmark spatial locality
fn bench_spatial_locality(c: &mut Criterion) {
    let mut group = c.benchmark_group("hilbert_locality");

    let order = 8u32;
    let size = 256u32;

    // Compare Hilbert curve locality vs row-major vs Z-order
    group.bench_function("hilbert_walk_64k", |b| {
        b.iter(|| {
            let mut prev = (0u32, 0u32);
            let mut distance = 0u64;
            for i in 0..65536u32 {
                let (x, y) = hilbert_d2xy(order, i);
                distance += (x as i64 - prev.0 as i64).abs() as u64
                    + (y as i64 - prev.1 as i64).abs() as u64;
                prev = (x, y);
            }
            black_box(distance);
        });
    });

    group.bench_function("row_major_walk_64k", |b| {
        b.iter(|| {
            let mut prev = (0u32, 0u32);
            let mut distance = 0u64;
            for i in 0..65536u32 {
                let x = i % size;
                let y = i / size;
                distance += (x as i64 - prev.0 as i64).abs() as u64
                    + (y as i64 - prev.1 as i64).abs() as u64;
                prev = (x, y);
            }
            black_box(distance);
        });
    });

    // Z-order (Morton curve)
    fn zorder_d2xy(d: u32) -> (u32, u32) {
        let mut x = 0u32;
        let mut y = 0u32;
        let mut bit = 1u32;
        let mut d = d;
        while d > 0 {
            x |= (d & 1) * bit;
            d >>= 1;
            y |= (d & 1) * bit;
            d >>= 1;
            bit <<= 1;
        }
        (x, y)
    }

    group.bench_function("zorder_walk_64k", |b| {
        b.iter(|| {
            let mut prev = (0u32, 0u32);
            let mut distance = 0u64;
            for i in 0..65536u32 {
                let (x, y) = zorder_d2xy(i);
                distance += (x as i64 - prev.0 as i64).abs() as u64
                    + (y as i64 - prev.1 as i64).abs() as u64;
                prev = (x, y);
            }
            black_box(distance);
        });
    });

    group.finish();
}

/// Benchmark memory layout efficiency
fn bench_memory_layout(c: &mut Criterion) {
    let mut group = c.benchmark_group("hilbert_memory");

    // Test batch struct efficiency
    group.bench_function("batch_push", |b| {
        let mut batch = HilbertCoordBatch::new();
        b.iter(|| {
            batch.clear();
            for i in 0..8 {
                batch.push(HilbertCoord { x: i, y: i * 2 });
            }
            black_box(&batch);
        });
    });

    // Compare Vec vs batch for small collections
    group.bench_function("vec_push_8", |b| {
        b.iter(|| {
            let mut vec = Vec::with_capacity(8);
            for i in 0..8 {
                vec.push(HilbertCoord { x: i, y: i * 2 });
            }
            black_box(vec);
        });
    });

    // Large batch processing
    group.throughput(Throughput::Elements(10000));
    group.bench_function("batch_10k_coords", |b| {
        b.iter(|| {
            let mut batches: Vec<HilbertCoordBatch> = Vec::new();
            let mut current_batch = HilbertCoordBatch::new();

            for i in 0..10000u32 {
                let (x, y) = hilbert_d2xy(8, i);
                current_batch.push(HilbertCoord { x, y });

                if current_batch.is_full() {
                    batches.push(current_batch.clone());
                    current_batch.clear();
                }
            }

            if current_batch.len > 0 {
                batches.push(current_batch);
            }

            black_box(batches);
        });
    });

    group.finish();
}

criterion_group!(
    benches,
    bench_hilbert_transform,
    bench_cached_lookup,
    bench_batch_processing,
    bench_write_queue,
    bench_spatial_locality,
    bench_memory_layout,
);
criterion_main!(benches);
