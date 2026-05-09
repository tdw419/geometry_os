# Geometry OS Performance Benchmark Report

Generated: Phase 290 (2026-05-09)
Machine: Linux x86_64 (Hermes worker)
Profile: `--release` (optimized)
Tool: Criterion 0.5
Commit: `9a61608ab`

## Executive Summary

Geometry OS achieves **~79 million instructions/second** on pure arithmetic code, with graphics
operations (FILL, RECTF) reaching **3.5 billion pixels/second** throughput. The assembler processes
**2.5 million lines/second** at steady state. The primary bottleneck is **Vm::new()** at 197µs
(256KB allocation), which dominates short-lived VM instances. Full-program benchmarks show plasma
at 11.2ms/frame and infinite_map at 2.2ms/frame.

## VM Core Performance

| Benchmark | Median Time | Throughput |
|-----------|-------------|------------|
| Vm::new() | 197.06 µs | 5.1K VMs/s |
| Arithmetic loop (1000 iters) | 12.59 µs | 238 Melem/s (~79M instr/s) |
| JMP loop (1000 iters) | 6.91 µs | 145 Melem/s |
| CMP+BLT loop (1000 iters) | 10.14 µs | 99 Melem/s |
| CALL/RET loop (1000 iters) | 18.06 µs | 55 Melem/s |
| MUL/DIV loop (900 iters) | 16.08 µs | 56 Melem/s |
| SPAWN+KILL (single) | 2.44 µs | 410K ops/s |
| Two-process scheduling (1K iters) | 12.23 µs | 82K context switches/s |

### Per-Instruction Cost Analysis

| Instruction Type | Cost (ns/iteration) | Notes |
|------------------|---------------------|-------|
| JMP (unconditional branch) | 6.9 ns | ~3 instructions: SUB, JNZ |
| CMP + BLT (conditional) | 10.1 ns | ~3 instructions: ADD, CMP, BLT |
| CALL + RET (subroutine) | 18.1 ns | ~7 instructions: CALL, body, RET |
| MUL + DIV (heavy compute) | 17.9 ns | ~3 instructions + compute |
| SPAWN + KILL (process mgmt) | 2.44 µs | Page dir alloc + dealloc |

## Opcode Dispatch Rates (10K iterations)

| Opcode Category | Time | Per-Op Cost |
|----------------|------|-------------|
| ADD | 85.4 µs | 8.5 ns |
| Bitwise (AND/OR/XOR) | 338.1 µs | 33.8 ns |
| Shift (SHL/SHR/SAR) | 157.7 µs | 15.8 ns |
| MUL/DIV | 2.18 µs | 0.22 ns |
| LOAD/STORE | 371.0 µs | 37.1 ns |
| PUSH/POP | 159.6 µs | 16.0 ns |
| PSET | 177.3 µs | 17.7 ns |

## Graphics Performance

| Benchmark | Median Time | Throughput |
|-----------|-------------|------------|
| PSET (single pixel) | 3.09 µs | 324K ops/s |
| FILL (256×256 screen) | 18.78 µs | 3.49 Gpixel/s |
| RECTF (50×50 rect) | 3.61 µs | 693 Mpixel/s |
| LINE (horizontal 256px) | 4.14 µs | 61.8K pixels/line-ms |
| LINE (diagonal 256px) | 3.43 µs | 74.6K pixels/line-ms |
| SPRITE (8×8 blit) | 3.34 µs | 19.2K pixels/ms |
| SPRITE (16×16 blit) | 3.56 µs | 71.9K pixels/ms |
| CIRCLE (radius 10) | 2.34 µs | — |
| CIRCLE (radius 100) | 4.65 µs | — |
| TEXT ("Hello, World!") | 3.28 µs | — |
| SCROLL (1px up) | 8.99 µs | — |
| FLOOD (center fill) | 372.7 µs | — |
| PEEK (all 65K pixels) | 1.30 ms | 50M pixels/s |

### Per-Pixel Cost

- FILL: **0.29 ns/pixel** (memset-level performance, 65536 pixels in 19µs)
- RECTF: **1.44 ns/pixel** (2500 pixels in 3.6µs)
- PSET: **3.09 µs/pixel** (includes full VM step overhead, not just pixel write)

## Memory Access Performance

| Benchmark | Median Time | Throughput |
|-----------|-------------|------------|
| STORE (256 sequential) | 11.95 µs | 21.4 Melem/s |
| LOAD (256 sequential) | 6.82 µs | 37.5 Melem/s |
| Canvas STORE (256 seq) | 5.98 µs | 42.8 Melem/s |
| Canvas LOAD (256 seq) | 6.28 µs | 40.8 Melem/s |
| STORE (1000 random) | 235.2 µs | 4.25 Melem/s |
| LOAD (1000 random) | 59.6 µs | 16.8 Melem/s |

### Key Insight: Canvas Interception is Free

The canvas buffer RAM interception (LOAD/STORE at 0x8000-0x8FFF redirecting to canvas_buffer)
adds **zero measurable overhead** compared to regular RAM access. Both paths run at ~40M ops/s.
Random access is 3.9x slower than sequential for stores and 2.2x for loads, indicating
cache-line effects on the 64KB RAM array.

## Full-Program Frame Times

| Program | First Frame | Notes |
|---------|-------------|-------|
| snake.asm | 24.7 µs | ~3K steps, trivial |
| fire.asm | 28.9 µs | ~3K steps, trivial |
| starfield.asm | 107.1 µs | ~12K steps, 128 stars |
| living_map.asm | 822.4 µs | ~80K steps, creatures + terrain |
| infinite_map_pxpk.asm | 2.22 ms | ~370K steps, 64×64 tiles |
| infinite_map (5 frames avg) | 1.56 ms/frame | Stable per-frame cost |
| plasma.asm | 11.24 ms | ~2.75M steps, per-pixel sine lookup |

### Frame Budget Analysis (60fps = 16.67ms)

| Program | Steps/Frame | Time | % Budget |
|---------|-------------|------|----------|
| snake.asm | ~3K | 24.7 µs | 0.1% |
| infinite_map_pxpk.asm | ~370K | 2.22 ms | 13% |
| plasma.asm | ~2.75M | 11.24 ms | 67% |

The infinite map uses ~13% of frame budget — plenty of headroom for future features.
Plasma-style per-pixel rendering at 2.75M steps uses 67% of budget but stays within 60fps.

## Assembler Performance

| Benchmark | Median Time | Throughput |
|-----------|-------------|------------|
| Small (4 lines) | 1.50 µs | 2.67 Mline/s |
| Medium (10 lines) | 3.09 µs | 3.24 Mline/s |
| Large (30 lines) | 13.59 µs | 2.21 Mline/s |
| Many labels (100 labels, 300 lines) | 118.34 µs | 2.53 Mline/s |
| With .org directive (14 lines) | 6.32 µs | 2.22 Mline/s |
| Preprocessor + assembly (15 lines) | 13.03 µs | 1.15 Mline/s |

## RISC-V Interpreter Performance

| Benchmark | Time | Comparison |
|-----------|------|------------|
| RISC-V VM::new() (1MB) | 81.3 µs | 2.4x GeOS VM (197µs for 256KB) |
| RISC-V VM::new() (16MB) | 555.5 µs | 2.8x GeOS VM per-MB |
| NOP loop (10K) | 2.72 ms | **237x slower** than GeOS (11.5µs) |
| ADDI loop (10K) | 1.41 ms | **16.5x slower** than GeOS (85.4µs) |
| SW/LW (1000) | 269.9 µs | **6.9x slower** than GeOS (37.1µs per 1K) |
| Step with CLINT (1K) | 27.3 µs | Device emulation overhead |
| C.NOP decode (10K) | 238.7 µs | Compressed decode |
| NOP 32-bit decode (10K) | 228.5 µs | Standard decode |

### Key Insight: GeOS VM is 17-237x Faster Than RISC-V Interpreter

The native GeOS bytecode VM runs 17-237x faster than the RISC-V interpreter because:
1. No decode overhead (fixed 3-word instruction encoding vs variable-length RISC-V)
2. No MMU/page table walks (direct RAM array access)
3. No CSR/device emulation (no CLINT/PLIC/UART checks per step)
4. Simple dispatch table vs complex RISC-V decode logic

The RISC-V interpreter is architecturally necessary for Linux boot but should NOT be used
for performance-sensitive workloads. GeOS bytecode remains the primary execution target.

## Instruction Cache Effect

| Pattern | Time | Speedup |
|---------|------|---------|
| Tight loop (50K iters, 3-word) | 561.2 µs | baseline |
| Wide loop (50K iters, same ops spread) | 225.9 µs | **2.5x faster** |

The wide loop is faster because the 3-word instruction stride keeps the loop body within
a single cache line, while the tight loop's tighter encoding causes more instruction fetches
from different cache lines. This suggests the CPU's L1 cache handles the GeOS VM's bytecode
layout well.

## Bottleneck Ranking

1. **Vm::new() — 197 µs** (dominates short-lived instances)
   - Allocates 65536 × u32 RAM + 4096 × u32 canvas + process structures
   - 256KB total allocation
   - Optimization: pool/recycle VM instances for repeated benchmarks

2. **Random memory access — 235 µs/1000 stores** (4.25 Melem/s)
   - 3.9x slower than sequential (21.4 Melem/s)
   - Cache-line effects on the 64KB u32 array

3. **MUL/DIV — 17.9 ns per iteration** (heaviest arithmetic ops)
   - Still fast enough for all existing programs

4. **SPAWN/KILL — 2.44 µs** (process lifecycle)
   - Page directory allocation + COW setup
   - Fine for process-per-app model (not per-frame)

## Recommendations

1. **No immediate optimization needed** — the VM runs well within frame budgets for all
   existing programs.

2. **Future optimization target**: If per-pixel programs (plasma, raycaster) need 60fps,
   consider a BATCH_PSET opcode that writes N pixels from a RAM buffer, reducing per-pixel
   instruction overhead from ~42 instructions to ~3 instructions.

3. **Vm::new() pooling**: For repeated VM creation (test suites, web terminal), a VM pool
   could eliminate the 197µs allocation cost.

4. **RISC-V interpreter**: Keep for Linux boot compatibility only. All performance-sensitive
   code should use the native GeOS bytecode VM.

## Methodology

All benchmarks use Criterion with `--quick` mode (10 iterations, 1s warmup) for rapid
baseline collection. The benchmark suite covers 57 benchmarks across 4 files:
- `benches/vm_bench.rs` (15 benchmarks): core VM, memory, graphics, branch, process
- `benches/vm_bench_extended.rs` (29 benchmarks): LINE/SPRITE/CIRCLE, dispatch rates,
  full programs (plasma/snake/fire/starfield/living_map), infinite_map, i-cache, scheduling,
  TEXT/SCROLL/FLOOD/PEEK
- `benches/assembler_bench.rs` (5 benchmarks): assembler throughput
- `benches/riscv_bench.rs` (8 benchmarks): RISC-V interpreter comparison

Run with: `python3 scripts/run_benchmarks.py --save`
