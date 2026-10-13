# Phase 5.3 E2E Test Specification

## Test: spatial_coexecution_e2e (Simplified)

**Purpose:** Verify end-to-end spatial processing from RISC-V guest hypercall to CPU processing

**Prerequisites:**
- SpatialHypervisorIntegration compiled and available
- GPU device accessible (wgpu 0.19)
- Tokio runtime available

**Test Flow:**
1. **Setup GPU resources**
   ```rust
   let (_instance, device, queue) = create_test_gpu().await;
   let ram_buffer = create_ram_buffer(&device, 1024 * 1024);
   let mut hypervisor = SpatialHypervisorIntegration::new(128, 64, ram_buffer.clone(), device, queue.clone());
   ```

2. **Allocate spatial region (Hypercall 0x123)**
   - Create SpatialAllocReq: req_id=0, width=10, height=5
   - Write to RAM at 0x1000
   - Call `handle_spatial_alloc(0x1000, 0x2000)`
   - Verify result == SPATIAL_ALLOC_OK (0)
   - Verify WALL cells placed around region
   - Read response at 0x2000, verify region_id == 1

3. **Submit processing request (Hypercall 0x124)**
   - Write input data [10, 20, 30] to RAM at 0x3000 (12 bytes = 3 x u32)
   - Create SpatialProcessReq:
     - req_id=100
     - input_buffer_ptr=0x3000, input_size=12
     - output_buffer_ptr=0x4000, output_size=12
     - region_id=1 (allocated above)
     - opcode=OPCODE_MUL (2)
   - Write request to RAM at 0x5000
   - Call `handle_spatial_process(0x5000, 0x6000)`

4. **Verify results**
   - result == SPATIAL_PROCESS_OK (0)
   - words_processed == 3
   - Read output at 0x4000
   - Parse as [u32; 3], verify equals [20, 40, 60] (multiplied by 2)

## Expected CPU Processing Behavior (Phase 5.3 Demo)

| Opcode | Value | Operation | Example Input | Example Output |
|--------|-------|-----------|---------------|----------------|
| OPCODE_ADD | 1 | word + 1 | [10, 20, 30] | [11, 21, 31] |
| OPCODE_MUL | 2 | word * 2 | [10, 20, 30] | [20, 40, 60] |
| OPCODE_SUB | 3 | word - 1 | [10, 20, 30] | [9, 19, 29] |
| OPCODE_DIV | 4 | word / 2 | [10, 20, 30] | [5, 10, 15] |

## Error Cases (Should All Return Non-Zero Result)

1. **Invalid region ID**
   - region_id=999 (non-existent)
   - Expected: result == SPATIAL_PROCESS_ERR_INVALID_REGION (-1)
   - words_processed == 0

2. **Invalid size (not multiple of 4)**
   - input_size=13, output_size=12
   - Expected: result == SPATIAL_PROCESS_ERR_INVALID_SIZE (-2)
   - words_processed == 0

3. **Unsupported opcode**
   - opcode=999 (outside 1-4 range)
   - Expected: result == SPATIAL_PROCESS_ERR_UNSUPPORTED_OPCODE (-3)
   - words_processed == 0

## Implementation Status

**✅ Complete:**
- SpatialHypervisorIntegration::handle_spatial_process() implemented
- Hypercall 0x124 handler integrated in RiscvExecutor::execute_frame()
- CPU processing demo (ADD, MUL, SUB, DIV) working
- All structures defined (SpatialProcessReq/Resp, error codes)
- Staging buffer infrastructure in place

**⏳ Pending:**
- Full E2E test execution (requires async tokio test harness)
- Replacement of CPU processing with GridRunner GPU execution

## Files Modified/Created

1. `/systems/infinite_map_rs/src/spatial_hypervisor_integration.rs`
   - Added `handle_spatial_process()` method
   - Added `read_process_req()` / `write_process_resp()` helpers
   - Added `process_data_on_cpu()` demo implementation
   - Added staging buffer fields (process_req_staging, process_resp_staging, input_data_staging, output_data_staging)

2. `/systems/infinite_map_rs/src/riscv_executor.rs`
   - Hypercall 0x124 handler integrated at lines 1268-1283
   - Imports: HYPERCALL_SPATIAL_PROCESS constant

3. `/systems/infinite_map_rs/tests/spatial_coexecution_test.rs`
   - E2E test file created (awaiting tokio test execution)

4. `/systems/infinite_map_rs/src/spatial/hypervisor_bridge.rs`
   - SpatialProcessReq/Resp structures already defined
   - Opcodes and error codes already defined

## Verification Commands

```bash
# Check compilation of integration module
cargo check -p infinite_map_rs --lib 2>&1 | grep -E "(error|warning.*spatial)"

# Run unit tests for hypervisor bridge
cargo test -p infinite_map_rs --lib spatial 2>&1 | tail -20

# Run the E2E test (when async support ready)
cargo test -p infinite_map_rs --test spatial_coexecution_test
```

## Next Steps (Phase 5.4 - Future)

1. Replace CPU processing with GridRunner execution on spatial grid
2. Implement spatial isolation verification (WALL blocks cross-region access)
3. Performance benchmarking (GPU vs CPU)
4. Complex instruction sequences (not just single opcodes)