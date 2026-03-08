# FFI Bridge Bytecode Verification Plan

**Goal:** Verify the "Symbolic Umbilical Cord" (FFI Bridge) by executing actual GeoASM bytecode that invokes Python functions through opcodes 0xF8-0xFB.

**Reference Implementation:**
- `visual-vm/PythonFFIBridge.ts` (Opcodes: 0xF8, 0xF9, 0xFA, 0xFB)
- `visual-vm/ffi_registry.json` (Whitelisted functions)
- `visual-vm/python_ffi_host.py` (Python subprocess)

---

## 1. GeoASM FFI Syntax

The following mnemonics are supported by `geoasm_lib.py`:

- `PY_CALL R_id, R_args, R_ret` (0xF8): Blocking call to Python function `func_id`.
- `PY_MAP R_hilbert, R_size, R_flags` (0xF9): Map Hilbert-indexed memory to NumPy.
- `PY_REQ R_id, R_args, R_req_id` (0xFA): Non-blocking async Python request.
- `PY_POLL R_req_id, R_status, R_result` (0xFB): Poll for async result.

---

## 2. Test Scenarios

### Scenario A: Simple Blocking Math (numpy.sum)
**Objective:** Verify `0xF8 (PY_CALL)` correctly passes memory offsets and returns a value.

1. **GeoASM Code (`ffi_sum.geoasm`):**
   ```geoasm
   ; Set up test data at memory addr 100
   MOVI R1, 10
   STR_IMM R1, 100    ; val1
   MOVI R1, 20
   STR_IMM R1, 101    ; val2
   
   ; Call numpy.sum (ID 1)
   MOVI R1, 1         ; funcId = 1 (numpy.sum)
   MOVI R2, 100       ; argsPtr = 100
   MOVI R3, 200       ; retPtr = 200
   PY_CALL R1, R2, R3
   
   ; Verify result (10 + 20 = 30) at [200]
   LDR R0, 200
   HALT
   ```

### Scenario B: Async Execution (numpy.mean)
**Objective:** Verify `0xFA (PY_REQ)` and `0xFB (PY_POLL)` workflow.

1. **GeoASM Code (`ffi_async.geoasm`):**
   ```geoasm
   ; Call numpy.mean (ID 2) asynchronously
   MOVI R1, 2         ; funcId = 2
   MOVI R2, 100       ; argsPtr
   PY_REQ R1, R2, R4  ; reqId in R4
   
   POLL_LOOP:
   PY_POLL R4, R5, R6 ; status in R5, result in R6
   MOVI R1, 1         ; status 1 = complete
   JNE R5, R1, POLL_LOOP
   
   ; Result is now in R6
   HALT
   ```

### Scenario C: Hilbert Memory Mapping
**Objective:** Verify `0xF9 (PY_MAP)` correctly converts Hilbert indices.

1. **GeoASM Code (`ffi_map.geoasm`):**
   ```geoasm
   MOVI R1, 1024      ; hilbertStart
   MOVI R2, 256       ; size
   MOVI R3, 0         ; flags
   PY_MAP R1, R2, R3
   ; R0 (return) should contain bufferId
   HALT
   ```

---

## 3. Execution Pipeline

### Step 1: Assembly
Assemble the GeoASM to binary:
```bash
python3 geoasm-cli/geoasm_lib.py assemble ffi_sum.geoasm -o ffi_sum.bin
```

### Step 2: Visual VM Execution
Run the binary through the Visual VM (which starts the `PythonFFIBridge`):
```bash
# This requires a test harness that loads the binary into the VM
npx vitest visual-vm/test_ffi_bytecode.test.ts
```

---

## 4. Success Criteria

1.  **Correctness:** Result of `numpy.sum` matches expectations (checked in registers/memory).
2.  **Stability:** Bridge does not timeout or crash during repeated calls.
3.  **Security:** Calling an ID not in `ffi_registry.json` returns `0xFFFFFFFF`.
4.  **Spatial Locality:** `PY_MAP` calls logged in `SyscallManager` show correct `(x, y)` conversions.

---

## 5. Integration with Rust Hypervisor

- Ensure `systems/hypervisor/src/geoasm_executor.wgsl` correctly handles the `0xF8-0xFB` opcodes by setting the `system.status` and waiting for the host to process the syscall.
- Verify that the `SyscallManager` in the Visual Shell correctly pulls the request from the GPU buffer and executes it via the bridge.

---

## Verification Tasks

- [ ] Create `visual-vm/test_ffi_bytecode.test.ts` to automate this.
- [ ] Implement a `numpy.multiply` test to verify 2D tensor handling.
- [ ] Stress test async polling with 100+ concurrent requests.
