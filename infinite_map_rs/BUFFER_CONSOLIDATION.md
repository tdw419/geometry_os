# Buffer Consolidation Plan - Phase 99 GPU Binding Limit Fix

## Problem
wgpu limits storage buffers to 8 per bind group, but RiscvExecutor currently has 11:
1. RAM buffer (binding 1) - large, cannot merge
2. Stats buffer (binding 2) - small
3. Syscall queue (binding 3) - medium
4. Display texture (binding 4) - texture, not storage
5. Console buffer (binding 5) - medium
6. Pending counts (binding 6) - very small (32 bytes)
7. VM status (binding 7) - very small (32 bytes)
8. Profiler buffer (binding 8) - medium
9. Debug ecall_pc_count (binding 9) - very small (4 bytes)
10. Debug op_system_count (binding 10) - very small (4 bytes)
11. Debug handle_syscall_count (binding 11) - very small (4 bytes)
12. Debug syscall_291_count (binding 12) - very small (4 bytes)
13. Debug vm_status_set_count (binding 13) - very small (4 bytes)

Total: 11 storage buffers (excluding bindings 0 and 4)

## Solution: Merge Very Small Buffers

Merge bindings 6, 7, 9-13 into a single combined_small_buffers buffer at binding 7.

### New Binding Layout (6 storage buffers total):
- binding 0: Uniform (not storage)
- binding 1: RAM buffer (storage) - UNCHANGED
- binding 2: Stats buffer (storage) - UNCHANGED
- binding 3: Syscall queue (storage) - UNCHANGED
- binding 4: Display texture (texture) - UNCHANGED
- binding 5: Console buffer (storage) - UNCHANGED
- binding 6: Profiler buffer (storage) - MOVED from binding 8
- binding 7: Combined small buffers (storage) - NEW

### Combined Small Buffer Layout (64 bytes total):
Offset 0-31:   pending_counts[8] (8 * u32 = 32 bytes)
Offset 32-63:  vm_status[8] (8 * u32 = 32 bytes)
Offset 64-67:  debug_ecall_pc_count (u32 = 4 bytes)
Offset 68-71:  debug_op_system_count (u32 = 4 bytes)
Offset 72-75:  debug_handle_syscall_count (u32 = 4 bytes)
Offset 76-79:  debug_syscall_291_count (u32 = 4 bytes)
Offset 80-83:  debug_vm_status_set_count (u32 = 4 bytes)
Offset 84-95:  _padding (12 bytes for alignment)

Total: 96 bytes

### WGSL Changes

```wgsl
// Combined small buffer struct
struct CombinedSmallBuffers {
    pending_counts: array<u32, 8>,     // Offset 0-31
    vm_status: array<u32, 8>,          // Offset 32-63
    debug_ecall_pc_count: atomic<u32>, // Offset 64-67
    debug_op_system_count: atomic<u32>, // Offset 68-71
    debug_handle_syscall_count: atomic<u32>, // Offset 72-75
    debug_syscall_291_count: atomic<u32>,    // Offset 76-79
    debug_vm_status_set_count: atomic<u32>,  // Offset 80-83
    _padding: array<u32, 3>,           // Offset 84-95
};

@group(0) @binding(7) var<storage, read_write> combined_small: CombinedSmallBuffers;

// Access helpers (if needed)
fn get_pending_counts(index: u32) -> atomic<u32> {
    return atomicLoad(&combined_small.pending_counts[index]);
}

fn get_vm_status(index: u32) -> u32 {
    return combined_small.vm_status[index];
}
```

### Rust Changes

1. Add new struct for combined buffer:
```rust
#[repr(C)]
#[derive(Debug, Clone, Copy, Pod, Zeroable)]
pub struct CombinedSmallBuffers {
    pub pending_counts: [u32; 8],
    pub vm_status: [u32; 8],
    pub debug_ecall_pc_count: u32,
    pub debug_op_system_count: u32,
    pub debug_handle_syscall_count: u32,
    pub debug_syscall_291_count: u32,
    pub debug_vm_status_set_count: u32,
    pub _padding: [u32; 3],
}
```

2. Update RiscvExecutor struct:
```rust
pub struct RiscvExecutor {
    // ... existing fields ...
    
    // Combined small buffer (replaces individual buffers)
    pub combined_small_buffer: wgpu::Buffer,
    combined_small_staging: wgpu::Buffer,
    
    // Remove individual debug counter buffers
    // pub debug_ecall_pc_count_buffer: wgpu::Buffer, // REMOVED
    // ... and so on for all 5 debug counters
}
```

3. Update bind group creation:
- Remove entries for bindings 6, 7, 9-13
- Add entry for binding 7 (combined_small_buffer)
- Move profiler from binding 8 to binding 6

4. Update readback functions:
- read_debug_counters() now reads from combined_small_staging at correct offsets

## Implementation Steps

1. [ ] Update WGSL shader with combined buffer struct
2. [ ] Add CombinedSmallBuffers struct in Rust
3. [ ] Update RiscvExecutor struct fields
4. [ ] Update buffer creation in new_with_caps()
5. [ ] Update bind group layout and bind group creation
6. [ ] Update read_debug_counters() to use correct offsets
7. [ ] Update any other code that accesses individual debug buffers
8. [ ] Run tests to verify

## Benefits

- Reduces from 11 to 6 storage buffers (45% reduction)
- Well under wgpu's 8 buffer limit
- Allows Phase 99 tests to run
- Minimal code changes (consolidates only the smallest buffers)