# Performance Profiling Guide

This guide covers the performance profiling tools integrated into the Geometry OS development workflow.

## Quick Start

```bash
# Run all benchmarks
make bench

# Run quick benchmarks
make bench-quick

# Compare with baseline
make bench-compare

# Check for performance regressions
python3 scripts/profiling/check_performance_regression.py
```

## Profiling Tools

### 1. CPU Profiling

Profile CPU usage of Python modules and scripts:

```bash
# Profile a module
make profile-cpu MODULE=systems.evolution_daemon

# Profile a specific function
make profile-cpu MODULE=systems.pixel_brain FUNCTION=process_inference

# Profile a script
make profile-cpu SCRIPT=tests/test_brain.py
```

The CPU profiler uses `cProfile` to capture:
- Function call counts
- Cumulative time per function
- Total time per function
- Top 20 hottest functions

### 2. Memory Profiling

Profile memory allocations:

```bash
# Profile module memory
make profile-memory MODULE=systems.evolution_daemon

# Profile script memory
make profile-memory SCRIPT=tests/test_brain.py
```

The memory profiler uses `tracemalloc` to capture:
- Total allocated memory
- Top memory allocations
- Allocation traceback
- Large allocation detection (>1MB)

### 3. Flamegraph Generation

Generate flamegraphs for visualization:

```bash
# Profile a running Python process
make profile-flamegraph PID=12345

# Profile a Rust binary
make profile-flamegraph BINARY=systems/infinite_map_rs/target/release/infinite_map_rs

# Profile Rust code with cargo-flamegraph
make profile-rust

# Profile Rust benchmarks
make profile-rust-bench
```

**Dependencies:**
- `py-spy`: `pip install py-spy`
- `flamegraph`: `cargo install flamegraph`
- `perf`: `sudo apt-get install linux-perf`

### 4. Heap Profiling

Profile heap allocations with Valgrind:

```bash
make profile-heap BINARY=path/to/binary
```

**Dependencies:**
- Valgrind: `sudo apt-get install valgrind`

### 5. Callgrind Profiling

Profile function calls with callgrind:

```bash
make profile-callgrind BINARY=path/to/binary

# Visualize results
kcachegrind profiling_results/callgrind.out
```

## Benchmark Suites

### Python Benchmarks

Located in `benchmarks/comprehensive_benchmark.py`:

| Benchmark | Description | Target |
|-----------|-------------|--------|
| Hilbert Curve Mapping | Coordinate transformation | < 100µs mean |
| RISC-V VM Execution | Instruction throughput | > 1M IPS |
| Memory Operations | Read/write throughput | > 500 MB/s |
| Damage Tracking | Region invalidation | < 50µs add |
| Texture Mapping | Pixel access | > 1M pixels/s |
| Glyph Rendering | Character rendering | > 10K glyphs/s |
| Message Serialization | JSON encode/decode | > 5K msgs/s |

### Rust Benchmarks

Located in `systems/infinite_map_rs/benches/`:

| Benchmark | Description |
|-----------|-------------|
| `compositor_benchmark` | Wayland compositor rendering |
| `damage_tracker_benchmark` | Terminal damage tracking |
| `hilbert_benchmark` | Hilbert curve operations |
| `hilbert_writer_benchmark` | Neural weight updates |
| `evolution_protocol_benchmark` | Daemon communication |
| `memory_operations_benchmark` | GPU memory ops |
| `riscv_executor_benchmark` | RISC-V instruction execution |
| `branch_instructions_benchmark` | Branch prediction |
| `fp_operations_benchmark` | Floating point ops |
| `syscall_benchmark` | System call overhead |

Run individual benchmarks:

```bash
cd systems/infinite_map_rs
cargo bench --bench compositor_benchmark
```

## Performance Regression Detection

### Pre-commit Hook

Performance checks run automatically when benchmark files change:

```bash
# Manual run
pre-commit run performance-check --all-files
```

### CI Integration

Performance regression checks run in CI via `.github/workflows/performance-benchmarks.yml`.

### Thresholds

| Severity | Change | Action |
|----------|--------|--------|
| OK | < 15% | Pass |
| Warning | 15-30% | Alert |
| Critical | > 30% | Fail CI |

### Updating Baseline

When intentional performance changes are made:

```bash
# Generate new baseline
make bench-baseline

# Or update with current results
python3 scripts/profiling/check_performance_regression.py --update-baseline
```

## Continuous Profiling

For long-running performance monitoring:

```bash
# Run once
python3 scripts/profiling/continuous_profiler.py --once

# Run continuously (5-minute intervals)
python3 scripts/profiling/continuous_profiler.py --interval 300

# Analyze historical trends
python3 scripts/profiling/continuous_profiler.py --analyze --days 7
```

The continuous profiler stores data in SQLite (`profiling_results/performance_history.db`) and provides:
- Trend analysis (improving/stable/degrading)
- Anomaly detection (2σ deviation)
- Historical comparisons

## Interpreting Results

### Criterion Output (Rust)

```
benchmark_name        time:   [1.2345 µs 1.3456 µs 1.4567 µs]
                      change: [-2.0875% -2.0012% -1.9206%]
```

- **time**: Lower is better (confidence interval)
- **change**: Negative = faster (improvement), Positive = slower (regression)

### Python Profiler Output

```
TOP FUNCTIONS:
  1. 2.3456s cumtime, 1000000 calls - function_name (file.py:42)
  2. 1.2345s cumtime, 500000 calls - another_function (file.py:100)
```

- **cumtime**: Cumulative time including subcalls
- **tottime**: Time in function only (excluding subcalls)
- **calls**: Number of times called

### Bottleneck Severity

| Icon | Severity | Criteria |
|------|----------|----------|
| 🔴 | High | > 5s cumulative time or > 30% regression |
| 🟡 | Medium | > 1s cumulative time or > 15% regression |
| 🟢 | Low | Minor issues |

## Best Practices

### Before Optimizing

1. **Profile first** - Don't guess at bottlenecks
2. **Establish baseline** - Run `make bench-baseline`
3. **Document targets** - Know your performance goals

### During Development

1. **Run quick benchmarks** - `make bench-quick` for fast feedback
2. **Profile critical paths** - Focus on hot loops
3. **Check memory** - Watch for allocation spikes

### Before Committing

1. **Run full benchmarks** - `make bench`
2. **Check regressions** - `make bench-compare`
3. **Document changes** - Note intentional performance changes

### Performance Targets

| Component | Target | Rationale |
|-----------|--------|-----------|
| Frame rendering | < 16ms | 60 FPS smooth visuals |
| Evolution protocol | < 10ms | Real-time neural sync |
| Hilbert transform | < 50ns | 20M ops/sec throughput |
| Damage tracking | < 10ns | 100M cells/sec updates |

## Troubleshooting

### py-spy Permission Denied

```bash
# Install with sudo for system-wide profiling
sudo pip install py-spy

# Or use --cap-add SYS_PTRACE with Docker
```

### perf Not Available

```bash
# Install linux-perf
sudo apt-get install linux-perf

# Allow perf without sudo
sudo sysctl -w kernel.perf_event_paranoid=1
```

### Flamegraph Tools Missing

```bash
# Install FlameGraph tools
git clone https://github.com/brendangregg/FlameGraph ~/FlameGraph
export PATH=$PATH:~/FlameGraph
```

### Benchmark Timeout

If benchmarks timeout in CI:
1. Reduce sample size: `cargo bench -- --sample-size 10`
2. Increase timeout in workflow
3. Skip slow benchmarks temporarily

## File Structure

```
geometry_os/
├── benchmarks/
│   ├── comprehensive_benchmark.py   # Main Python benchmarks
│   ├── run_benchmarks.py            # Benchmark runner
│   ├── baseline_results_v2.json     # Performance baseline
│   └── README.md                    # Benchmark documentation
├── scripts/profiling/
│   ├── profile_toolkit.py           # Profiling tools
│   ├── check_performance_regression.py
│   └── continuous_profiler.py       # Long-term monitoring
├── systems/infinite_map_rs/benches/ # Rust benchmarks
│   ├── compositor_benchmark.rs
│   ├── damage_tracker_benchmark.rs
│   └── ...
├── profiling_results/               # Output directory
│   ├── performance_history.db       # Historical data
│   └── *.svg                        # Flamegraphs
└── docs/
    └── PROFILING.md                 # This file
```
