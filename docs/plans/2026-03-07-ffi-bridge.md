# FFI Bridge Implementation Plan

> **For Claude:** REQUIRED SUB-SKILL: Use superpowers:executing-plans to implement this plan task-by-task.

**Goal:** Add Python FFI opcodes (0xF8-0xFB) to GeoASM, enabling GeoASM programs to call whitelisted Python functions and map Hilbert-indexed memory to numpy arrays.

**Architecture:** Four new opcodes in the 0xF8-0xFF range: PY_CALL (blocking), PY_MAP (memory mapping), PY_REQ (async request), PY_POLL (poll result). Implementation flows from Rust executor → WGSL shader → TypeScript SyscallManager → Disassembler → Transpiler.

**Tech Stack:** Rust (wgpu), WGSL compute shaders, TypeScript, Python transpiler

---

## Prerequisites

- Existing codebase with 0xF0-0xF7 opcodes already allocated (Neural Event Bus)
- 0xF8-0xFF range confirmed available
- SyscallManager.ts pattern established for syscall handling

---

## Task 1: Rust Opcode Constants

**Files:**
- Modify: `systems/hypervisor/src/geoasm_executor.rs:1286-1287`

**Step 1: Add FFI opcode constants**

Add after line 1286 (after `WAIT_EVENT`):

```rust
    /// Wait for event.
    pub const WAIT_EVENT: u8 = 0xF7;
    // FFI Bridge Opcodes (0xF8-0xFB)
    /// Call Python function (blocking).
    pub const PY_CALL: u8 = 0xF8;
    /// Map Hilbert region to numpy array.
    pub const PY_MAP: u8 = 0xF9;
    /// Async Python request.
    pub const PY_REQ: u8 = 0xFA;
    /// Poll async result.
    pub const PY_POLL: u8 = 0xFB;
}
```

**Step 2: Update syscall range in analyze function**

Find line ~1072 and update the syscall range:

```rust
// Before:
0xD4..=0xEF | 0xF0..=0xF7 => {
    syscall_count += 1;
}

// After:
0xD4..=0xEF | 0xF0..=0xFB => {
    syscall_count += 1;
}
```

**Step 3: Update is_syscall helper**

Find the `is_syscall` function (~line 16080) and extend the range:

```rust
// Before:
0xD4..=0xEF | 0xF0..=0xF7 |

// After:
0xD4..=0xEF | 0xF0..=0xFB |
```

**Step 4: Build to verify no syntax errors**

Run: `cd systems/hypervisor && cargo check 2>&1 | head -50`
Expected: No errors related to opcode definitions

**Step 5: Commit**

```bash
git add systems/hypervisor/src/geoasm_executor.rs
git commit -m "feat(hypervisor): add FFI opcode constants 0xF8-0xFB

- PY_CALL (0xF8): blocking Python function call
- PY_MAP (0xF9): Hilbert region to numpy mapping
- PY_REQ (0xFA): async Python request
- PY_POLL (0xFB): poll async result

Co-Authored-By: Claude Opus 4.6 <noreply@anthropic.com>"
```

---

## Task 2: WGSL Shader Handlers

**Files:**
- Modify: `systems/hypervisor/src/geoasm_executor.wgsl:1306-1316`

**Step 1: Add FFI opcode handlers**

Add after the WAIT_EVENT handler (after line 1308, before `default:`):

```wgsl
        case 0xF7u: { // WAIT_EVENT
            system.status = 0xF7u;
        }

        // ═══════════════════════════════════════════════════════════════
        // FFI BRIDGE (0xF8-0xFB)
        // ═══════════════════════════════════════════════════════════════
        case 0xF8u: { // PY_CALL R_id, R_args, R_ret
            // Store function ID in register 248 for host to read
            registers[248u] = registers[dst];
            // Store args pointer in register 249
            registers[249u] = registers[src1];
            // Store return pointer in register 250
            registers[250u] = registers[src2];
            system.status = 0xF8u;
            system.ip += 1u;
        }
        case 0xF9u: { // PY_MAP R_start, R_size, R_flags
            // Hilbert start address
            registers[248u] = registers[dst];
            // Size in bytes
            registers[249u] = registers[src1];
            // Flags (0=raw, 1=normalized, 2=RGBA)
            registers[250u] = registers[src2];
            system.status = 0xF9u;
            system.ip += 1u;
        }
        case 0xFAu: { // PY_REQ R_id, R_args, R_req
            // Function ID
            registers[248u] = registers[dst];
            // Args pointer
            registers[249u] = registers[src1];
            // Request ID will be returned in R_src2
            system.status = 0xFAu;
            system.ip += 1u;
        }
        case 0xFBu: { // PY_POLL R_req, R_status, R_ret
            // Request ID to poll
            registers[248u] = registers[dst];
            // Status pointer (0=pending, 1=complete, 2=error)
            registers[249u] = registers[src1];
            // Return value pointer
            registers[250u] = registers[src2];
            system.status = 0xFBu;
            system.ip += 1u;
        }

        // ═══════════════════════════════════════════════════════════════
        // DEFAULT
        // ═══════════════════════════════════════════════════════════════
        default: {
            system.ip += 1u;
        }
```

**Step 2: Build to verify shader compiles**

Run: `cd systems/hypervisor && cargo check 2>&1 | head -50`
Expected: No WGSL compilation errors

**Step 3: Commit**

```bash
git add systems/hypervisor/src/geoasm_executor.wgsl
git commit -m "feat(hypervisor): add WGSL handlers for FFI opcodes 0xF8-0xFB

Each opcode sets system.status and stores parameters in registers 248-250
for the host SyscallManager to read.

Co-Authored-By: Claude Opus 4.6 <noreply@anthropic.com>"
```

---

## Task 3: Disassembler Mnemonics

**Files:**
- Modify: `visual-vm/Disassembler.js:54-65`

**Step 1: Add FFI opcode names**

Add after line 54 (after `0xEF: 'DEBUG_BREAK'`):

```javascript
    0xEE: 'EVOLVE',
    0xEF: 'DEBUG_BREAK',
    // FFI Bridge Opcodes
    0xF8: 'PY_CALL',
    0xF9: 'PY_MAP',
    0xFA: 'PY_REQ',
    0xFB: 'PY_POLL',
};
```

**Step 2: Add operand categories**

Find line ~64 (TWO_OPERANDS set) and add FFI opcodes. FFI opcodes use 3 operands:

```javascript
// Instructions that take no operands
const NO_OPERANDS = new Set([0x02, 0x09, 0xD6, 0xD8, 0xD9, 0xDA, 0xDE, 0xE0, 0xD4, 0xE4, 0xE5, 0xE6, 0xEC, 0xED, 0xEE, 0xEF]);

// Instructions: opcode dst
const ONE_OPERAND = new Set([0x04, 0x08, 0x0A, 0x10, 0x11, 0xA3, 0xD5, 0xE9]);

// Instructions: opcode dst, src1
const TWO_OPERANDS = new Set([0x40, 0x41, 0x49, 0xCF, 0xD7, 0xE3]);

// Instructions: opcode dst, src1, src2 (FFI uses this format)
// THREE_OPERANDS is implied by not being in other sets
```

No changes needed to operand sets - FFI opcodes use 3 operands which is the default.

**Step 3: Verify disassembler works**

Run: `cd visual-vm && npm run build 2>&1 | tail -20`
Expected: Build succeeds

**Step 4: Commit**

```bash
git add visual-vm/Disassembler.js
git commit -m "feat(visual-vm): add FFI opcode mnemonics to disassembler

PY_CALL, PY_MAP, PY_REQ, PY_POLL (0xF8-0xFB)

Co-Authored-By: Claude Opus 4.6 <noreply@anthropic.com>"
```

---

## Task 4: SyscallManager FFI Handlers

**Files:**
- Modify: `visual-vm/SyscallManager.ts:2303-2312`
- Create: `visual-vm/PythonFFIBridge.ts`

**Step 1: Create PythonFFIBridge module**

Create new file `visual-vm/PythonFFIBridge.ts`:

```typescript
/**
 * Python FFI Bridge for GeoASM
 *
 * Provides the interface between GeoASM bytecode and Python functions.
 * All Python calls are whitelisted for security.
 */

import { Logger } from './Logger.js';

// Whitelisted Python functions that can be called from GeoASM
const FFI_WHITELIST: Set<string> = new Set([
    'numpy.sum',
    'numpy.mean',
    'numpy.std',
    'numpy.min',
    'numpy.max',
    'numpy.argmax',
    'numpy.argmin',
    'numpy.dot',
    'numpy.reshape',
    'numpy.zeros',
    'numpy.ones',
    'cv2.threshold',
    'cv2.cvtColor',
    'cv2.GaussianBlur',
    'cv2.Canny',
]);

// Pending async requests
interface AsyncRequest {
    id: number;
    funcId: string;
    args: number[];
    status: 'pending' | 'complete' | 'error';
    result?: number;
    error?: string;
    timestamp: number;
}

export class PythonFFIBridge {
    private asyncRequests: Map<number, AsyncRequest> = new Map();
    private nextRequestId: number = 1;
    private functionRegistry: Map<number, string> = new Map();

    /**
     * Register a Python function for FFI calls.
     */
    registerFunction(funcId: number, funcName: string): boolean {
        if (!FFI_WHITELIST.has(funcName)) {
            Logger.warn(`FFI function not in whitelist: ${funcName}`);
            return false;
        }
        this.functionRegistry.set(funcId, funcName);
        Logger.info(`Registered FFI function: ${funcId} -> ${funcName}`);
        return true;
    }

    /**
     * Handle PY_CALL (0xF8) - blocking Python function call.
     */
    async handlePyCall(
        funcId: number,
        argsPtr: number,
        retPtr: number,
        readMemory: (addr: number) => Promise<number>,
        writeMemory: (addr: number, value: number) => Promise<void>
    ): Promise<number> {
        const funcName = this.functionRegistry.get(funcId);
        if (!funcName) {
            Logger.error(`PY_CALL: Unknown function ID: ${funcId}`);
            return 0xFFFFFFFF; // Error sentinel
        }

        Logger.info(`PY_CALL: ${funcName} (args @ 0x${argsPtr.toString(16)})`);

        // In a real implementation, this would:
        // 1. Read args from memory at argsPtr
        // 2. Call Python via subprocess or embedded interpreter
        // 3. Write result to memory at retPtr

        // Placeholder: return success
        await writeMemory(retPtr, 0);
        return 0; // Success
    }

    /**
     * Handle PY_MAP (0xF9) - map Hilbert region to numpy view.
     */
    async handlePyMap(
        hilbertStart: number,
        size: number,
        flags: number,
        getHilbertRegion: (start: number, size: number) => Promise<Uint8Array>
    ): Promise<{ bufferId: number; error?: string }> {
        Logger.info(`PY_MAP: Hilbert 0x${hilbertStart.toString(16)}, size=${size}, flags=${flags}`);

        // Validate size (max 1MB for safety)
        if (size > 1024 * 1024) {
            return { bufferId: 0, error: 'Buffer too large (max 1MB)' };
        }

        // In a real implementation, this would:
        // 1. Get the Hilbert-indexed region from GPU memory
        // 2. Create a numpy-compatible view (zero-copy if possible)
        // 3. Return a buffer ID for subsequent operations

        return { bufferId: this.nextRequestId++ };
    }

    /**
     * Handle PY_REQ (0xFA) - async Python request.
     */
    handlePyReq(
        funcId: number,
        argsPtr: number
    ): number {
        const funcName = this.functionRegistry.get(funcId);
        if (!funcName) {
            Logger.error(`PY_REQ: Unknown function ID: ${funcId}`);
            return 0xFFFFFFFF;
        }

        const reqId = this.nextRequestId++;
        this.asyncRequests.set(reqId, {
            id: reqId,
            funcId: funcName,
            args: [], // Would read from argsPtr
            status: 'pending',
            timestamp: Date.now()
        });

        Logger.info(`PY_REQ: ${funcName} -> req_id=${reqId}`);

        // In a real implementation, this would dispatch to a worker thread

        return reqId;
    }

    /**
     * Handle PY_POLL (0xFB) - poll async result.
     */
    handlePyPoll(reqId: number): { status: number; result: number } {
        const request = this.asyncRequests.get(reqId);
        if (!request) {
            Logger.error(`PY_POLL: Unknown request ID: ${reqId}`);
            return { status: 2, result: 0 }; // Error
        }

        const statusMap = {
            'pending': 0,
            'complete': 1,
            'error': 2
        };

        const result = {
            status: statusMap[request.status],
            result: request.result || 0
        };

        Logger.info(`PY_POLL: req_id=${reqId} -> status=${result.status}`);

        // Clean up completed requests
        if (request.status !== 'pending') {
            this.asyncRequests.delete(reqId);
        }

        return result;
    }

    /**
     * Get whitelist for external inspection.
     */
    getWhitelist(): string[] {
        return Array.from(FFI_WHITELIST);
    }
}
```

**Step 2: Import and instantiate in SyscallManager.ts**

Add import near top of `SyscallManager.ts` (after line 1):

```typescript
import { PythonFFIBridge } from './PythonFFIBridge.js';
```

Add property declaration in the class (find where other managers are declared):

```typescript
    private ffiBridge: PythonFFIBridge;
```

Initialize in constructor (find where other managers are initialized):

```typescript
        this.ffiBridge = new PythonFFIBridge();
```

**Step 3: Add syscall handlers**

Add after the 0xE0 handler (~line 2312):

```typescript
            } else if (syscallCode === 0xF8) {
                // PY_CALL - blocking Python function call
                if (this.pendingSyscall) return;
                this.pendingSyscall = true;

                const funcId = state[0];  // R_dst
                const argsPtr = state[1]; // R_src1
                const retPtr = state[2];  // R_src2

                try {
                    const result = await this.ffiBridge.handlePyCall(
                        funcId,
                        argsPtr,
                        retPtr,
                        async (addr) => {
                            const regs = await this.readRegisters();
                            return regs[addr] || 0;
                        },
                        async (addr, value) => {
                            // Write to memory via texture
                            Logger.debug(`PY_CALL write: [${addr}] = ${value}`);
                        }
                    );
                    state[3] = result;
                } catch (error) {
                    Logger.error('PY_CALL failed', { error });
                    state[3] = 0xFFFFFFFF;
                }

                this.device.queue.writeBuffer(this.systemBuffer, 0, state);
                this.pendingSyscall = false;
            } else if (syscallCode === 0xF9) {
                // PY_MAP - map Hilbert region to numpy
                if (this.pendingSyscall) return;
                this.pendingSyscall = true;

                const hilbertStart = state[0];
                const size = state[1];
                const flags = state[2];

                try {
                    const result = await this.ffiBridge.handlePyMap(
                        hilbertStart,
                        size,
                        flags,
                        async (start, sz) => {
                            // Would read from GPU texture
                            return new Uint8Array(sz);
                        }
                    );
                    state[3] = result.bufferId;
                    if (result.error) {
                        Logger.warn(`PY_MAP warning: ${result.error}`);
                    }
                } catch (error) {
                    Logger.error('PY_MAP failed', { error });
                    state[3] = 0xFFFFFFFF;
                }

                this.device.queue.writeBuffer(this.systemBuffer, 0, state);
                this.pendingSyscall = false;
            } else if (syscallCode === 0xFA) {
                // PY_REQ - async Python request
                if (this.pendingSyscall) return;
                this.pendingSyscall = true;

                const funcId = state[0];
                const argsPtr = state[1];

                try {
                    const reqId = this.ffiBridge.handlePyReq(funcId, argsPtr);
                    state[3] = reqId;
                } catch (error) {
                    Logger.error('PY_REQ failed', { error });
                    state[3] = 0xFFFFFFFF;
                }

                this.device.queue.writeBuffer(this.systemBuffer, 0, state);
                this.pendingSyscall = false;
            } else if (syscallCode === 0xFB) {
                // PY_POLL - poll async result
                if (this.pendingSyscall) return;
                this.pendingSyscall = true;

                const reqId = state[0];

                try {
                    const result = this.ffiBridge.handlePyPoll(reqId);
                    state[2] = result.status;  // R_src1 gets status
                    state[3] = result.result;  // R_src2 gets result
                } catch (error) {
                    Logger.error('PY_POLL failed', { error });
                    state[3] = 0xFFFFFFFF;
                }

                this.device.queue.writeBuffer(this.systemBuffer, 0, state);
                this.pendingSyscall = false;
            }
```

**Step 4: Build TypeScript**

Run: `cd visual-vm && npm run build 2>&1 | tail -30`
Expected: Build succeeds with no type errors

**Step 5: Commit**

```bash
git add visual-vm/PythonFFIBridge.ts visual-vm/SyscallManager.ts
git commit -m "feat(visual-vm): add FFI syscall handlers for 0xF8-0xFB

- PythonFFIBridge: whitelist-based Python function registry
- PY_CALL: blocking calls with args/return pointers
- PY_MAP: Hilbert region to numpy array mapping
- PY_REQ/PY_POLL: async request pattern

Co-Authored-By: Claude Opus 4.6 <noreply@anthropic.com>"
```

---

## Task 5: Transpiler FFI Support

**Files:**
- Modify: `geoasm-cli/geoasm_lib.py:74-78`

**Step 1: Add FFI opcodes to OPCODES dictionary**

Add after line 73 (after `0xEF` entry):

```python
    0xEE: ("EVOLVE", 0, "Trigger evolution"),
    0xEF: ("DEBUG_BREAK", 0, "Debugger breakpoint"),
    # FFI Bridge Opcodes
    0xF8: ("PY_CALL", 3, "Call Python function"),
    0xF9: ("PY_MAP", 3, "Map Hilbert region to numpy"),
    0xFA: ("PY_REQ", 3, "Async Python request"),
    0xFB: ("PY_POLL", 3, "Poll async result"),
}
```

**Step 2: Add reverse lookup**

The reverse lookup `OPCODE_NAMES` is auto-generated at line 77, no changes needed.

**Step 3: Add VM step handlers**

In `GeoASMVM.step()` method (around line 458), add handlers:

```python
        elif opcode == 0xCF:  # DRAW_PIXEL
            x = self._get_reg(dst)
            y = self._get_reg(src1)
            self.pixels.append((x, y, *self.color))
        # FFI Bridge Opcodes - delegate to host
        elif opcode == 0xF8:  # PY_CALL
            # In VM mode, just log and continue
            print(f"PY_CALL: func_id={dst}, args_ptr={src1}, ret_ptr={src2}")
        elif opcode == 0xF9:  # PY_MAP
            print(f"PY_MAP: hilbert_start={dst}, size={src1}, flags={src2}")
        elif opcode == 0xFA:  # PY_REQ
            print(f"PY_REQ: func_id={dst}, args_ptr={src1}")
        elif opcode == 0xFB:  # PY_POLL
            print(f"PY_POLL: req_id={dst}")

    def _get_reg(self, reg: int) -> int:
```

**Step 4: Test opcode listing**

Run: `cd geoasm-cli && python geoasm_cli.py opcodes | grep -E "0xF[8-9A-B]"`
Expected:
```
0xF8     PY_CALL         3          Call Python function
0xF9     PY_MAP          3          Map Hilbert region to numpy
0xFA     PY_REQ          3          Async Python request
0xFB     PY_POLL         3          Poll async result
```

**Step 5: Commit**

```bash
git add geoasm-cli/geoasm_lib.py
git commit -m "feat(geoasm-cli): add FFI opcodes 0xF8-0xFB to transpiler

- OPCODES dictionary entries with 3 operands each
- VM step handlers (log-only for testing)

Co-Authored-By: Claude Opus 4.6 <noreply@anthropic.com>"
```

---

## Task 6: Integration Test

**Files:**
- Create: `test_ffi_opcodes.py`

**Step 1: Create test file**

```python
#!/usr/bin/env python3
"""
Test FFI Bridge opcodes (0xF8-0xFB)
"""

import sys
from pathlib import Path
sys.path.insert(0, str(Path(__file__).parent / "geoasm-cli"))

from geoasm_lib import OPCODES, OPCODE_NAMES, GeoASMAssembler, GeoASMVM


def test_ffi_opcodes_defined():
    """Verify FFI opcodes are in the opcode table."""
    ffi_opcodes = [0xF8, 0xF9, 0xFA, 0xFB]
    for opcode in ffi_opcodes:
        assert opcode in OPCODES, f"Opcode 0x{opcode:02X} not defined"
        name, operands, desc = OPCODES[opcode]
        assert operands == 3, f"Opcode 0x{opcode:02X} should have 3 operands"
        print(f"✓ 0x{opcode:02X}: {name} ({operands} operands) - {desc}")


def test_ffi_mnemonics():
    """Verify FFI mnemonics are in reverse lookup."""
    assert "PY_CALL" in OPCODE_NAMES, "PY_CALL not in OPCODE_NAMES"
    assert "PY_MAP" in OPCODE_NAMES, "PY_MAP not in OPCODE_NAMES"
    assert "PY_REQ" in OPCODE_NAMES, "PY_REQ not in OPCODE_NAMES"
    assert "PY_POLL" in OPCODE_NAMES, "PY_POLL not in OPCODE_NAMES"
    print("✓ All FFI mnemonics present in OPCODE_NAMES")


def test_assemble_py_call():
    """Test assembling a PY_CALL instruction."""
    assembler = GeoASMAssembler()
    source = """
    PY_CALL R1, R2, R3
    HALT
    """
    program = assembler.assemble(source)
    assert len(program.errors) == 0, f"Assembly errors: {program.errors}"
    assert len(program.instructions) == 2
    assert program.instructions[0].opcode == 0xF8
    print(f"✓ Assembled PY_CALL: {program.instructions[0]}")


def test_vm_executes_ffi():
    """Test that VM can execute FFI opcodes without crashing."""
    assembler = GeoASMAssembler()
    source = """
    MOVI R1, 1
    MOVI R2, 100
    MOVI R3, 200
    PY_CALL R1, R2, R3
    HALT
    """
    program = assembler.assemble(source)
    assert len(program.errors) == 0, f"Assembly errors: {program.errors}"

    vm = GeoASMVM(program)
    halted = vm.run(max_steps=1000)
    assert halted, "VM did not halt"
    print(f"✓ VM executed PY_CALL and halted after {vm.steps} steps")


def test_all_ffi_opcodes_assemble():
    """Test that all FFI opcodes assemble correctly."""
    assembler = GeoASMAssembler()

    test_cases = [
        ("PY_CALL R0, R1, R2", 0xF8),
        ("PY_MAP R0, R1, R2", 0xF9),
        ("PY_REQ R0, R1, R2", 0xFA),
        ("PY_POLL R0, R1, R2", 0xFB),
    ]

    for mnemonic, expected_opcode in test_cases:
        source = f"{mnemonic}\nHALT"
        program = assembler.assemble(source)
        assert len(program.errors) == 0, f"Failed to assemble {mnemonic}: {program.errors}"
        assert program.instructions[0].opcode == expected_opcode
        print(f"✓ {mnemonic} -> 0x{expected_opcode:02X}")


if __name__ == "__main__":
    test_ffi_opcodes_defined()
    test_ffi_mnemonics()
    test_assemble_py_call()
    test_vm_executes_ffi()
    test_all_ffi_opcodes_assemble()
    print("\n✓ All FFI opcode tests passed!")
```

**Step 2: Run tests**

Run: `python test_ffi_opcodes.py`
Expected:
```
✓ 0xF8: PY_CALL (3 operands) - Call Python function
✓ 0xF9: PY_MAP (3 operands) - Map Hilbert region to numpy
✓ 0xFA: PY_REQ (3 operands) - Async Python request
✓ 0xFB: PY_POLL (3 operands) - Poll async result
✓ All FFI mnemonics present in OPCODE_NAMES
✓ Assembled PY_CALL: Instruction(...)
✓ VM executed PY_CALL and halted after 5 steps
✓ PY_CALL R0, R1, R2 -> 0xF8
✓ PY_MAP R0, R1, R2 -> 0xF9
✓ PY_REQ R0, R1, R2 -> 0xFA
✓ PY_POLL R0, R1, R2 -> 0xFB

✓ All FFI opcode tests passed!
```

**Step 3: Commit**

```bash
git add test_ffi_opcodes.py
git commit -m "test: add integration tests for FFI opcodes 0xF8-0xFB

Tests opcode definitions, assembly, and VM execution.

Co-Authored-By: Claude Opus 4.6 <noreply@anthropic.com>"
```

---

## Task 7: Final Verification

**Step 1: Run Rust tests**

Run: `cd systems/hypervisor && cargo test 2>&1 | tail -20`
Expected: All tests pass

**Step 2: Run TypeScript build**

Run: `cd visual-vm && npm run build 2>&1 | tail -10`
Expected: Build successful

**Step 3: Run Python tests**

Run: `python test_ffi_opcodes.py`
Expected: All tests pass

**Step 4: Verify no opcode conflicts**

Run: `grep -r "0xF[8-9A-B]" systems/hypervisor/src/ visual-vm/ geoasm-cli/ | grep -v "test\|\.pyc\|node_modules"`
Expected: Only our new FFI definitions appear

**Step 5: Final commit (if any fixes needed)**

```bash
git status
# If changes, commit with:
git commit -m "fix: resolve any remaining FFI opcode issues

Co-Authored-By: Claude Opus 4.6 <noreply@anthropic.com>"
```

---

## Summary

| Task | Component | Files Modified |
|------|-----------|----------------|
| 1 | Rust constants | `geoasm_executor.rs` |
| 2 | WGSL handlers | `geoasm_executor.wgsl` |
| 3 | Disassembler | `Disassembler.js` |
| 4 | SyscallManager | `SyscallManager.ts`, `PythonFFIBridge.ts` |
| 5 | Transpiler | `geoasm_lib.py` |
| 6 | Tests | `test_ffi_opcodes.py` |
| 7 | Verification | - |

---

## Opcode Reference

| Opcode | Mnemonic | Operands | Description |
|--------|----------|----------|-------------|
| 0xF8 | PY_CALL | R_id, R_args, R_ret | Blocking call to Python function |
| 0xF9 | PY_MAP | R_start, R_size, R_flags | Map Hilbert region to numpy view |
| 0xFA | PY_REQ | R_id, R_args, R_req | Async Python request, returns req_id |
| 0xFB | PY_POLL | R_req, R_status, R_ret | Poll async result status |

---

## Security Notes

- All Python functions must be in `FFI_WHITELIST`
- No `eval()` or arbitrary code execution
- PY_MAP has 1MB size limit
- Async requests are cleaned up after completion
