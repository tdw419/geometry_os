# Phase 5.3: GPU-RISC-V Co-Execution

## Overview

Phase 5.3 implements hybrid execution where RISC-V (CPU-side) performs computation
and spatial routing (GPU-side) enforces secure data access patterns.

## Architecture Pattern

```
┌─────────────────┐
│  RISC-V Guest   │
│  (Compute)      │
└────────┬────────┘
         │ 1. Write to shared buffer
         ↓
┌──────────────────────────────────┐
│  Shared Memory Buffer (GPU RAM)  │
│  - Address: 0x02000000           │
│  - Size: 1MB                     │
│  - Structure:                    │
│    [request_header]              │
│    [input_data]                  │
│    [processing_region_id]        │
│    [output_data]                 │
└────────┬─────────────────────────┘
         │ 2. GPU reads via spatial routing
         ↓
┌─────────────────┐
│ Spatial Grid    │
│ (128x64 cells)  │
│ - LDI copies    │
│   data to GPU   │
│ - Instructions  │
│   process data  │
└────────┬────────┘
         │ 3. GPU writes results
         ↓
┌──────────────────────────────────┐
│  Shared Memory Buffer (GPU RAM)  │
│  - Output region populated       │
└────────┬─────────────────────────┘
         │ 4. RISC-V reads results
         ↓
┌─────────────────┐
│  RISC-V Guest   │
│  (Read results) │
└─────────────────┘
```

## Hypercalls

### spatial_submit_process (ID: 0x124)

Request structure:
```c
struct SpatialProcessReq {
    uint64_t req_id;
    uint32_t input_buffer_ptr;    // Guest address of input data
    uint32_t input_size;
    uint32_t output_buffer_ptr;   // Guest address for results
    uint32_t output_size;
    uint32_t region_id;           // Spatial region ID to use
    uint32_t opcode;              // Processing opcode (e.g., ADD, MUL)
};
```

Response structure:
```c
struct SpatialProcessResp {
    uint64_t req_id;
    int32_t result;               // 0 = success, negative = error
    uint32_t words_processed;     // Number of words processed
};
```

## Implementation Steps

### Step 1: Add Shared Memory Buffer to RiscvExecutor
- Create 1MB GPU buffer at fixed MMIO address (0x02000000)
- Add staging buffers for GPU↔CPU data transfer
- Implement buffer copying from guest RAM to shared buffer

### Step 2: Extend SpatialHypervisorIntegration
- Add `handle_spatial_process()` method
- Parse SpatialProcessReq from guest memory
- Copy input data to spatial grid cells (DATA instructions)
- Execute spatial grid for N ticks
- Copy results from spatial grid back to guest memory

### Step 3: Implement Spatial Data Transfer
- Map guest RAM data to spatial DATA cells
- DATA cells hold values at specific (x, y) coordinates
- Processing instructions (ADD, MUL, etc.) operate on DATA cells
- Results stored in DATA cells for readback

### Step 4: Add Hypercall Handler
- Add spatial_submit_process (0x124) to syscall handling
- Call SpatialHypervisorIntegration::handle_spatial_process()
- Write response back to guest memory

### Step 5: Create E2E Test
- RISC-V program writes array to guest RAM
- Calls spatial_submit_process to process on GPU
- Reads results from guest RAM
- Verifies correctness

## Files to Modify

1. `systems/infinite_map_rs/src/riscv_executor.rs`
   - Add shared_process_buffer field
   - Add hypercall 0x124 handling in execute_frame()

2. `systems/infinite_map_rs/src/spatial_hypervisor_integration.rs`
   - Add `handle_spatial_process()` method
   - Implement data transfer to/from spatial grid
   - Tick spatial grid for processing

3. `systems/infinite_map_rs/src/spatial/hypervisor_bridge.rs`
   - Add SpatialProcessReq and SpatialProcessResp structs
   - Add error codes for processing

4. New test: `tests/spatial_coexecution_test.rs`
   - E2E test of RISC-V → GPU → RISC-V data flow

## Memory Layout

```
Shared Memory Buffer (0x02000000, 1MB):
Offset    | Size      | Description
----------|-----------|-----------------------------------
0x0000    | 16 bytes  | SpatialProcessReq (input)
0x0010    | 4 KB      | Input data (guest → GPU)
0x1010    | 4 bytes   | Region ID
0x1014    | 4 bytes   | Opcode
0x1018    | 4 KB      | Output data (GPU → guest)
0x5018    | 16 bytes  | SpatialProcessResp (output)
```

## Example Use Case

RISC-V program:
```assembly
# Write input array to guest RAM
li a0, 0x1000        # Input buffer address
li a1, 10            # Value 10
sw a1, 0(a0)         # Store value
li a1, 20
sw a1, 4(a0)         # Store value
li a1, 30
sw a1, 8(a0)         # Store value

# Setup spatial process request
li a0, 0x200000      # Shared buffer address
li t0, 0x1000        # Input buffer guest address
sw t0, 0x8(a0)       # input_buffer_ptr
li t0, 12            # input_size (3 words)
sw t0, 0xC(a0)
li t0, 0x2000        # output_buffer guest address
sw t0, 0x10(a0)      # output_buffer_ptr
li t0, 12            # output_size
sw t0, 0x14(a0)
li t0, 1             # region_id
sw t0, 0x18(a0)      # region_id
li t0, 4             # opcode = MUL
sw t0, 0x1C(a0)      # opcode

# Submit to spatial processing
li a7, 0x124         # spatial_submit_process hypercall
ecall

# Read results
li a0, 0x2000        # Output buffer address
lw a1, 0(a0)         # Result 1 (should be 20 if mul by 2)
lw a2, 4(a0)         # Result 2
lw a3, 8(a0)         # Result 3
```

## Success Criteria

1. ✅ Shared memory buffer accessible from RISC-V guest
2. ✅ Data correctly copied from guest RAM to spatial grid
3. ✅ Spatial processing executes on GPU
4. ✅ Results correctly copied back to guest RAM
5. ✅ E2E test passes with simple arithmetic operations
6. ✅ Security: Spatial isolation enforced (WALL blocks access)

## Dependencies

- Phase 5.2 complete: SpatialAllocator and hypercall bridge working
- Phase 6.5 complete: GridRunner library extracted
- Existing staging buffer infrastructure in SpatialHypervisorIntegration

## Estimated Effort

- Step 1 (Shared buffer): 1 day
- Step 2 (Extension): 1 day
- Step 3 (Data transfer): 1 day
- Step 4 (Hypercall): 0.5 day
- Step 5 (Test): 1 day
- **Total: 4.5 days**