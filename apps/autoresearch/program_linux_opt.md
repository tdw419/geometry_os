# Linux Spatial Optimization Research Loop

This loop optimizes the "Crystallization" of the Ubuntu RISC-V kernel into Geometry OS Fonts.

## Goal
Maximize the **Spatial Locality Score (SLS)** of the generated `.rts.png` Brick.
Higher SLS = Better GPU texture cache performance and faster kernel execution.

## The Metric: SLS
Measured via `systems/pixel_compiler/benchmark_locality.py`.
- **Primary Metric**: `locality_score` (0.0 to 1.0)
- **Secondary Metric**: `crystallization_time_ms` (lower is better)

## Experimentation Loop

LOOP FOREVER:

1. **Observe**: Run `python3 systems/pixel_compiler/benchmark_locality.py --target systems/ubuntu_riscv/vmlinux` and extract the current SLS.
2. **Identify Bottleneck**: Analyze the mapping logic in `systems/pixel_compiler/riscv_to_geometric_vm.py`.
3. **Hypothesize**: 
   - "If I use a Z-Order curve instead of a Hilbert curve, will the cache hit rate increase for branch instructions?"
   - "If I map source registers to the Alpha channel and destination to Green, will data flow be more spatially coherent?"
   - "If I group opcodes by 'Functional Sectors' (e.g., all Arithmetic in one 64x64 block), will it execute faster?"
4. **Act**: Modify the mapping logic in `systems/pixel_compiler/riscv_to_geometric_vm.py`.
5. **Verify**:
   - Run the JIT: `python3 systems/pixel_compiler/riscv_to_geometric_vm.py systems/ubuntu_riscv/vmlinux /tmp/test.png`
   - Run the benchmark: `python3 systems/pixel_compiler/benchmark_locality.py --brick /tmp/test.png`
6. **Decide**:
   - **KEEP**: If SLS increased by >0.05 without doubling crystallization time.
   - **DISCARD**: Otherwise.
7. **Record**: Log changes and SLS to `results_linux_opt.tsv`.

## Constraints
- **RISC-V Compliance**: The mapping must remain semantically correct (Opcode must stay in the Red channel as per `geometric_programming.wgsl`).
- **Determinism**: The same binary must always produce the same visual pattern for a given iteration.
