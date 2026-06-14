# Investigation Plan: `kmem_cache` NULL dereference

## Objective
Identify the cause of the `kmem_cache` NULL pointer dereference occurring during early boot.

## Steps

### Phase 1: Verify Memory Map
1. **Analyze `System.map`**: Locate `memblock` and `kmem_cache` symbol addresses.
2. **Review Patch Logic**: Inspect `src/riscv/kernel_patches.rs` for potential overlaps in `patch_memblock`.

### Phase 2: Diagnostic Verification
1. **QEMU Ground Truth**: Obtain a trace of `kmem_cache` initialization from QEMU to compare against our expectations.
2. **Console Output**: Enable kernel console output in `linux_quick_boot` (requires user confirmation) to capture the panic log.

### Phase 3: Patch Refinement
1. **Adjust Memblock Patches**: Modify `patch_memblock` if overlap is confirmed.
2. **Verify Initialization**: Ensure `init_kmem_cache` or equivalent is being called correctly.

## Verification
- Boot successful until the next stall or init.
