# Glyph-Atomic Swarm Execution (Phase 50)

Target: 100+ Billion GIPS via Massively Parallel Execution.

## Objective
Geometry OS is designed to treat the "Infinite Map" as a computing substrate. A single thread executing glyphs is too slow. The goal of this research loop is to modify the `glyph_microcode.wgsl` shader to execute **thousands of independent glyph programs simultaneously** across the GPU.

## The Challenge: Divergence & Registers
When running `@workgroup_size(256)`, different threads will hit different `BRANCH` instructions. 
1. **Thread Divergence**: The AI must optimize how warps handle divergent branching.
2. **Register File**: Currently, `ExecutionState` has one global register array. The AI must implement **Thread-Local Registers** (or `var<private>`) so each thread has its own execution context.

## Metrics
- **Target**: 100,000,000,000+ GIPS (100 Billion)
- **Measurement**: `python3 apps/autoresearch/run_swarm_research.py`
- **Correctness**: All 10,000 parallel loops must return `Accumulator == 3`.

## Experimentation Loop
1. **Observe**: Run `python3 apps/autoresearch/run_swarm_research.py`.
2. **Analyze**: Look at `glyph_microcode.wgsl`. Notice that `@workgroup_size(1)` is blocking parallel execution.
3. **Act**: 
   - Change to `@workgroup_size(64)` or `(256)`.
   - Update the `main` function so `global_id.x` dictates the `PC` offset (each thread starts at a different sector of the map).
   - Move `registers` from `var<storage>` to `var<private> registers: array<u32, 32>` so they are thread-local.
4. **Verify**: The benchmark MUST pass the correctness check (all accumulators = 3).
5. **Decide**: Keep the shader if GIPS increases.

## Candidate Optimizations
| Priority | Optimization | Expected Gain |
|----------|--------------|---------------|
| 1 | **Thread-Local Registers** - Use `var<private>` instead of Global Storage | 10x |
| 2 | **Workgroup Sizing** - Tune `@workgroup_size(X)` to fit Intel i915 warp size (32 or 64) | 2x |
| 3 | **Shared Memory (SLM)** - Load the program texture into `var<workgroup>` memory before execution to avoid VRAM latency | 5x |

## Success Definition
> "The map is alive. Every pixel is computing simultaneously."
