# Ollama Debug Prompt for RISC-V Ecall Issue

## Problem Statement
I'm debugging a RISC-V ecall that should trigger a spatial allocation hypercall (ID 0x123).

## What Works
1. ✅ Direct unit test of `SpatialHypervisorIntegration::handle_spatial_alloc(0x2000, 0x2010)` PASSES
   - Allocates 10x20 region
   - Returns 30 wall cells
   - result=0 (success)

2. ✅ RISC-V assembly test binary is correctly generated:
   ```
   00001000 <_start>:
       1000: 200002b7  lui  t0,0x20000
       ...
       103c: 12300893  li   a7,291        # 0x123 = 291 decimal
       1040: 00000073  ecall
   ```

## What's Broken
The E2E test executes the RISC-V binary but the hypercall handler is NEVER called:

1. ❌ No log messages: "VM 0 triggered X syscall(s)" - never appears
2. ❌ No log messages: "Processing Syscall..." - never appears  
3. ❌ Response buffer at 0x2010 contains all zeros (uninitialized)
4. ❌ Result flag at 0x3000 is 0 (fail)

## Key Code Paths

### 1. RiscvExecutor::execute_frame() syscall handling (riscv_executor.rs:1216-1290)
```rust
if status[0] == 1 {  // STATUS_WAITING_SYSCALL
    let count = pending[0];
    info!("VM 0 triggered {} syscall(s)", count);
    
    if count > 0 {
        let entry = &queue[0];
        info!("Processing Syscall {} for VM {}", entry.num, entry.vm_id);
        
        match entry.num {
            64 => { /* sys_write */ },
            93 => { /* sys_exit */ },
            _ => {
                info!("Unhandled syscall: {}", entry.num);
                if entry.num == HYPERCALL_SPATIAL_ALLOC as u32 {
                    // Phase 5.2: Handle spatial alloc
                }
            }
        }
    }
}
```

### 2. Syscall queue structure (riscv_executor.rs:126-140)
```rust
#[repr(C)]
pub struct SyscallEntry {
    pub vm_id: u32,
    pub num: u32,      // Syscall number (0x123 for spatial alloc)
    pub arg0: u32,     // req_ptr (0x2000)
    pub arg1: u32,     // resp_ptr (0x2010)
    pub arg2: u32,
    pub arg3: u32,
    pub arg4: u32,
    pub arg5: u32,
    pub result: i32,
    pub _pad: u32,
}
```

## Debugging Questions

1. **Why does status[0] never equal 1?**
   - The WGSL shader should set STATUS_WAITING_SYSCALL when ecall executes
   - But the CPU-side check never sees this flag set

2. **Where is the ecall handler in the WGSL shader?**
   - Need to verify `fn do_ecall()` writes to syscall_queue
   - Need to verify syscall arguments (a0, a1) are copied correctly

3. **How does the WGSL shader transfer syscall info to CPU?**
   - Check syscall_queue_buffer usage
   - Check pending_counts_buffer usage
   - Check vm_status_buffer usage

## Files to Examine

- `src/shaders/glyph_vm_riscv.wgsl` - WGSL RISC-V executor
- `src/riscv_executor.rs` - CPU-side syscall processing (lines 1216-1290)
- `src/spatial_hypervisor_integration.rs` - Spatial allocation logic (PASSES in direct test)

## Suggested Investigation Steps

1. Add logging to WGSL's `do_ecall()` to verify it's being called
2. Add logging to verify syscall_queue buffer is being written
3. Check if GPU→CPU staging buffers are properly synchronized
4. Verify syscall number 0x123 (291) isn't being filtered out

## Request

Analyze the WGSL shader's ecall handling path and identify why syscalls aren't reaching the CPU-side processing code. Focus on:
1. The syscall_queue write path in WGSL
2. The status flag setting (STATUS_WAITING_SYSCALL)
3. The pending counts increment
4. GPU→CPU buffer synchronization for syscall data

Provide specific code fixes and logging additions to trace the full ecall → CPU path.