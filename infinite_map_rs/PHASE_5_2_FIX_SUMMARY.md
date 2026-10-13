# Phase 5.2 RISC-V Ecall Fix Summary

## Root Cause

The WGSL shader's `do_ecall()` function was writing to the wrong buffers:

**What shader was using:**
- `syscall_buffer` (array<u32, 8>) at binding 4
- `syscall_count` (array<u32, 1>) at binding 5

**What CPU-side code expected:**
- `syscall_queue_buffer` (SyscallEntry array) at binding 3
- `pending_counts_buffer` (u32 array) at binding 6
- `vm_status_buffer` (u32 array) at binding 7

## Fix Applied

### 1. Updated WGSL Bindings (src/shaders/glyph_vm_riscv.wgsl)

```wgsl
@group(0) @binding(3) var<storage, read_write> syscall_queue_buffer: array<SyscallEntry>;
@group(0) @binding(4) var<storage, read_write> display_buffer: array<u32>;
@group(0) @binding(5) var<storage, read_write> console_buffer: array<u32>;
@group(0) @binding(6) var<storage, read_write> pending_counts_buffer: array<u32>;
@group(0) @binding(7) var<storage, read_write> vm_status_buffer: array<u32>;
@group(0) @binding(8) var<storage, read_write> profiler_buffer: array<ProfilerEntry>;

const STATUS_WAITING_SYSCALL: u32 = 1u;

struct SyscallEntry {
    vm_id: u32,
    num: u32,
    arg0: u32,
    arg1: u32,
    arg2: u32,
    arg3: u32,
    arg4: u32,
    arg5: u32,
    result: i32,
    _pad: u32,
}
```

### 2. Fixed `do_ecall()` Function

```wgsl
fn do_ecall() -> u32 {
    let syscall_num = registers[17];
    let vm_id = 0u;
    let arg0 = registers[10];
    let arg1 = registers[11];

    // ... handle SYS_EXIT, SYS_WRITE, SYS_GETPID ...

    // Custom hypercalls (e.g., 0x123 for spatial alloc)
    let index = pending_counts_buffer[vm_id];
    syscall_queue_buffer[index] = SyscallEntry(
        vm_id,
        syscall_num,
        arg0,
        arg1,
        registers[12],  // arg2 (a2)
        registers[13],  // arg3 (a3)
        registers[14],  // arg4 (a4)
        registers[15],  // arg5 (a5)
        0i32, 0u
    );
    pending_counts_buffer[vm_id] = index + 1u;
    vm_status_buffer[vm_id] = STATUS_WAITING_SYSCALL;

    return 0u;
}
```

## Verification

✅ **Ecall Detection Working:**
- `sys_write` (64) detected and processed
- `sys_exit` (93) detected and processed
- Custom hypercall `0x123` detected and processed
- CPU-side handler correctly reads SyscallEntry structures

✅ **Spatial Allocation Working:**
- Direct unit test passes (30 wall cells for 10x20 region)
- E2E RISC-V guest can trigger hypercall
- Response structure written to RAM correctly

## Remaining Issue

There's a **timing issue** where the RISC-V guest reads the response buffer immediately after `ecall`, but the CPU hasn't finished processing the hypercall yet. The guest sees all zeros in the response.

**Solution needed:** Add proper synchronization between RISC-V guest and hypervisor, or have the guest poll for completion.

## Files Modified

1. `src/shaders/glyph_vm_riscv.wgsl` - Fixed buffer bindings and ecall handling
2. `tests/test_spatial_alloc_simple.S` - Changed syscall number to decimal 291
3. `ROADMAP.md` - Updated Phase 5.2 status

## Test Status

- ✅ `test_spatial_alloc_direct` - PASSES (direct allocation works)
- ⚠️ `test_spatial_alloc_e2e_simple` - Syscall detected but response timing issue
- 📝 Created polling version test for future use