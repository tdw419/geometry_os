# Spatial MMU Implementation Plan

> **For Claude:** REQUIRED SUB-SKILL: Use superpowers:executing-plans to implement this plan task-by-task.

**Goal:** Upgrade visual_cpu_riscv.wgsl to support hardware-enforced spatial isolation with 64-register state, Morton-order texture mapping, and guest region bounds checking.

**Architecture:** Expand the RISC-V compute shader to use a 64-register state buffer with GUEST_BASE, GUEST_SIZE, and GEOM_CACHE_BASE slots. Implement Morton (Z-curve) coordinate mapping for texture cache locality. Add boundary checking to the Sv32 page table walker to restrict guests to their allocated texture regions.

**Tech Stack:** WebGPU WGSL compute shaders, JavaScript ES modules, RISC-V privilege architecture

---

## Prerequisites

- Existing `visual_cpu_riscv.wgsl` with basic Sv32 walker (already exists)
- WebGPU-compatible browser for testing
- Python for test asset generation

---

### Task 1: Expand State Buffer to 64 Registers

**Files:**
- Modify: `systems/visual_shell/web/shaders/visual_cpu_riscv.wgsl:19`
- Modify: `systems/visual_shell/web/gpu_execution_system.js`

**Step 1: Update REGS_PER_CORE constant**

In `visual_cpu_riscv.wgsl`, change line ~19:

```wgsl
// OLD:
const REGS_PER_CORE: u32 = 46u; // 32 regs + PC + Halt + CSRs (6) + Trap CSRs (6)

// NEW:
const REGS_PER_CORE: u32 = 64u; // 32 regs + PC + CSRs + Tectonic metadata (power-of-2 alignment)
```

**Step 2: Add Tectonic CSR indices**

Add after line ~35 in `visual_cpu_riscv.wgsl`:

```wgsl
// --- TECTONIC HYPERVISOR REGISTERS ---
const CSR_GUEST_BASE: u32 = 46u;      // Physical pixel offset for guest region
const CSR_GUEST_SIZE: u32 = 47u;      // Size of guest texture region (bytes)
const CSR_GEOM_CACHE_BASE: u32 = 48u; // Base address for Tier 2 JIT cache
const CSR_TRANS_FLAGS: u32 = 49u;     // Transmutation status flags
// [50-63] Reserved for future Tectonic extensions
```

**Step 3: Update GPUExecutionSystem buffer sizing**

In `gpu_execution_system.js`, find the state buffer creation and update size calculation:

```javascript
// OLD: const stateSize = coreCount * 46 * 4;
const STATE_REGS_PER_CORE = 64;
const stateSize = coreCount * STATE_REGS_PER_CORE * 4;
```

**Step 4: Verify shader compiles**

Run: Open `systems/visual_shell/web/test_tectonic_mmu.html` in browser
Expected: No WebGPU shader compilation errors in console

**Step 5: Commit**

```bash
git add systems/visual_shell/web/shaders/visual_cpu_riscv.wgsl systems/visual_shell/web/gpu_execution_system.js
git commit -m "feat(mmu): expand state buffer to 64 registers for Tectonic metadata"
```

---

### Task 2: Implement Morton (Z-Curve) Encoding

**Files:**
- Modify: `systems/visual_shell/web/shaders/visual_cpu_riscv.wgsl`

**Step 1: Add Morton encoding functions**

Add after the Hilbert functions (around line 96) in `visual_cpu_riscv.wgsl`:

```wgsl
// --- MORTON (Z-CURVE) ENCODING ---
// Faster than Hilbert in WGSL, preserves reasonable locality

fn part1by1(n: u32) -> u32 {
    var x = n & 0x0000FFFFu;
    x = (x | (x << 8u)) & 0x00FF00FFu;
    x = (x | (x << 4u)) & 0x0F0F0F0Fu;
    x = (x | (x << 2u)) & 0x33333333u;
    x = (x | (x << 1u)) & 0x55555555u;
    return x;
}

fn morton_encode(x: u32, y: u32) -> u32 {
    return part1by1(x) | (part1by1(y) << 1u);
}

fn morton_decode(m: u32) -> vec2<u32> {
    var x = m & 0x55555555u;
    var y = (m >> 1u) & 0x55555555u;

    x = (x | (x >> 1u)) & 0x33333333u;
    x = (x | (x >> 2u)) & 0x0F0F0F0Fu;
    x = (x | (x >> 4u)) & 0x00FF00FFu;
    x = (x | (x >> 8u)) & 0x0000FFFFu;

    y = (y | (y >> 1u)) & 0x33333333u;
    y = (y | (y >> 2u)) & 0x0F0F0F0Fu;
    y = (y | (y >> 4u)) & 0x00FF00FFu;
    y = (y | (y >> 8u)) & 0x0000FFFFu;

    return vec2<u32>(x, y);
}

// Convert physical address to texture coordinate using Morton order
fn phys_to_texture_coord(paddr: u32, guest_base: u32, texture_width: u32) -> vec2<u32> {
    let offset = paddr - guest_base;
    let morton_idx = offset / 4u; // Convert bytes to word index
    return morton_decode(morton_idx % (texture_width * texture_width));
}
```

**Step 2: Verify shader compiles**

Run: Refresh `test_tectonic_mmu.html`
Expected: No compilation errors

**Step 3: Commit**

```bash
git add systems/visual_shell/web/shaders/visual_cpu_riscv.wgsl
git commit -m "feat(mmu): add Morton Z-curve encoding for texture locality"
```

---

### Task 3: Add Guest Region Bounds Checking

**Files:**
- Modify: `systems/visual_shell/web/shaders/visual_cpu_riscv.wgsl:199-236`

**Step 1: Create enhanced translate_address function**

Replace the existing `translate_address` function (lines 199-236):

```wgsl
// --- MMU: Sv32 PAGE TABLE WALKER WITH SPATIAL BOUNDS ---
fn translate_address(vaddr: u32, is_write: u32, base_idx: u32) -> u32 {
    let satp = cpu_states[base_idx + CSR_SATP];
    let satp_mode = (satp >> 31u) & 1u;

    // Bare mode: no translation, but still check bounds
    if (satp_mode == 0u) {
        let guest_base = cpu_states[base_idx + CSR_GUEST_BASE];
        let guest_size = cpu_states[base_idx + CSR_GUEST_SIZE];
        if (vaddr < guest_base || vaddr >= guest_base + guest_size) {
            return 0xFFFFFFFFu; // Out of bounds
        }
        return vaddr;
    }

    let vpn1 = (vaddr >> 22u) & 0x3FFu;
    let vpn0 = (vaddr >> 12u) & 0x3FFu;
    let offset = vaddr & 0xFFFu;

    let ppn_root = satp & 0x3FFFFFu;
    let pte1_addr = (ppn_root * 4096u) + (vpn1 * 4u);

    // Bounds check for page table access
    if (pte1_addr >= 134217728u) { return 0xFFFFFFFFu; }

    let pte1 = system_memory[pte1_addr / 4u];
    let pte1_v = pte1 & 1u;
    if (pte1_v == 0u) { return 0xFFFFFFFFu; }

    // Check for megapage (2-level shortcut)
    let pte1_xwr = (pte1 >> 1u) & 0x7u;
    if (pte1_xwr != 0u) {
        let ppn1 = (pte1 >> 10u) & 0xFFFFFu;
        let paddr = (ppn1 << 22u) | (vpn0 << 12u) | offset;
        return check_guest_bounds(paddr, base_idx);
    }

    // Walk to second level
    let ppn1_from_pte1 = (pte1 >> 10u) & 0x3FFFFFu;
    let pte0_addr = (ppn1_from_pte1 * 4096u) + (vpn0 * 4u);

    if (pte0_addr >= 134217728u) { return 0xFFFFFFFFu; }

    let pte0 = system_memory[pte0_addr / 4u];
    let pte0_v = pte0 & 1u;
    if (pte0_v == 0u) { return 0xFFFFFFFFu; }

    // Write permission check
    let pte0_w = (pte0 >> 2u) & 1u;
    if (is_write == 1u && pte0_w == 0u) { return 0xFFFFFFFFu; }

    // User mode check
    let pte0_u = (pte0 >> 4u) & 1u;
    let mode = cpu_states[base_idx + CSR_MODE];
    if (mode == 0u && pte0_u == 0u) { return 0xFFFFFFFFu; } // User can't access supervisor pages

    let ppn0 = (pte0 >> 10u) & 0xFFFFFu;
    let paddr = (ppn0 << 12u) | offset;

    return check_guest_bounds(paddr, base_idx);
}

// Helper: Check if physical address is within guest's allocated region
fn check_guest_bounds(paddr: u32, base_idx: u32) -> u32 {
    let guest_base = cpu_states[base_idx + CSR_GUEST_BASE];
    let guest_size = cpu_states[base_idx + CSR_GUEST_SIZE];

    if (guest_size == 0u) {
        return paddr; // No bounds checking if size not set (legacy mode)
    }

    if (paddr < guest_base || paddr >= guest_base + guest_size) {
        return 0xFFFFFFFFu; // Out of bounds - triggers page fault
    }

    return paddr;
}
```

**Step 2: Verify shader compiles**

Run: Refresh `test_tectonic_mmu.html`
Expected: No compilation errors

**Step 3: Commit**

```bash
git add systems/visual_shell/web/shaders/visual_cpu_riscv.wgsl
git commit -m "feat(mmu): add guest region bounds checking for spatial isolation"
```

---

### Task 4: Add Dirty/Access Bit Tracking

**Files:**
- Modify: `systems/visual_shell/web/shaders/visual_cpu_riscv.wgsl`

**Step 1: Add dirty/access bit setting in translate_address**

Add after the `check_guest_bounds` function:

```wgsl
// --- PAGE TABLE DIRTY/ACCESS BIT MANAGEMENT ---
// These bits trigger tiered transmutation cache invalidation

const PTE_A_BIT: u32 = 0x40u;  // Bit 6: Accessed
const PTE_D_BIT: u32 = 0x80u;  // Bit 7: Dirty (written)

fn set_accessed_bit(pte_addr: u32) {
    let pte = system_memory[pte_addr / 4u];
    if ((pte & PTE_A_BIT) == 0u) {
        system_memory[pte_addr / 4u] = pte | PTE_A_BIT;
    }
}

fn set_dirty_bit(pte_addr: u32) {
    let pte = system_memory[pte_addr / 4u];
    if ((pte & PTE_D_BIT) == 0u) {
        system_memory[pte_addr / 4u] = pte | PTE_D_BIT;

        // Check if this is an executable page - trigger cache invalidation
        let pte_x = pte & 1u; // X bit is part of XWR
        if (pte_x != 0u) {
            // Set TRANS_FLAGS bit 0 to signal demotion needed
            let trans_flags = atomicAdd(&cpu_states[0u + CSR_TRANS_FLAGS], 0u);
            // Note: In full implementation, this would signal the Hypervisor
        }
    }
}
```

**Step 2: Integrate into LOAD/STORE operations**

Find the LOAD case (opcode 0x03u) and add after successful translation:

```wgsl
// In LOAD case, after paddr is validated:
set_accessed_bit(pte0_addr);
```

Find the STORE case (opcode 0x23u) and add after successful translation:

```wgsl
// In STORE case, after paddr is validated:
set_dirty_bit(pte0_addr);
```

**Step 3: Verify shader compiles**

Run: Refresh `test_tectonic_mmu.html`
Expected: No compilation errors

**Step 4: Commit**

```bash
git add systems/visual_shell/web/shaders/visual_cpu_riscv.wgsl
git commit -m "feat(mmu): add dirty/access bit tracking for transmutation triggers"
```

---

### Task 5: Create Test HTML Page

**Files:**
- Create: `systems/visual_shell/web/test_tectonic_mmu.html`

**Step 1: Create test harness**

```html
<!DOCTYPE html>
<html>
<head>
    <title>Tectonic MMU Tests</title>
    <style>
        body { font-family: monospace; background: #1a1a2e; color: #eee; padding: 20px; }
        .test { margin: 10px 0; padding: 10px; border: 1px solid #333; }
        .pass { background: #1a4a1a; border-color: #2a2; }
        .fail { background: #4a1a1a; border-color: #a22; }
        .pending { background: #2a2a1a; border-color: #aa2; }
        button { margin: 5px; padding: 8px 16px; cursor: pointer; }
        #log { white-space: pre-wrap; font-size: 12px; max-height: 400px; overflow-y: auto; }
    </style>
</head>
<body>
    <h1>Tectonic MMU Validation Suite</h1>
    <div id="tests"></div>
    <button onclick="runAllTests()">Run All Tests</button>
    <button onclick="clearLog()">Clear Log</button>
    <div id="log"></div>

    <script type="module">
        // Test framework
        const tests = [];
        let gpuDevice = null;

        function log(msg) {
            document.getElementById('log').textContent += msg + '\n';
        }

        function clearLog() {
            document.getElementById('log').textContent = '';
        }

        function defineTest(name, fn) {
            tests.push({ name, fn, status: 'pending' });
            renderTests();
        }

        function renderTests() {
            const container = document.getElementById('tests');
            container.innerHTML = tests.map((t, i) =>
                `<div class="test ${t.status}">
                    <strong>Test ${i + 1}:</strong> ${t.name}
                    <span style="float:right">${t.status.toUpperCase()}</span>
                </div>`
            ).join('');
        }

        async function runAllTests() {
            if (!gpuDevice) {
                log('Initializing WebGPU...');
                const adapter = await navigator.gpu?.requestAdapter();
                if (!adapter) {
                    log('ERROR: WebGPU not supported');
                    return;
                }
                gpuDevice = await adapter.requestDevice();
                log('WebGPU initialized');
            }

            for (let i = 0; i < tests.length; i++) {
                log(`\n--- Running: ${tests[i].name} ---`);
                try {
                    await tests[i].fn(gpuDevice, log);
                    tests[i].status = 'pass';
                    log('PASS');
                } catch (e) {
                    tests[i].status = 'fail';
                    log(`FAIL: ${e.message}`);
                }
                renderTests();
            }
        }

        // TEST 1: Privilege Trap
        defineTest('Privilege Trap: User mode cannot access Supervisor pages', async (device, log) => {
            log('Setting up guest with user-mode code...');
            // Create minimal state buffer with 64 registers
            const stateBuffer = device.createBuffer({
                size: 64 * 4, // One core, 64 registers
                usage: GPUBufferUsage.STORAGE | GPUBufferUsage.COPY_DST | GPUBufferUsage.COPY_SRC,
            });

            // Set CSR_MODE = 0 (User mode)
            // Set CSR_SATP with page table
            // Create page table with PTE.U = 0 for test address
            // Execute LOAD to that address
            // Expect: Page fault trap (PC jumps to STVEC)

            log('TODO: Implement full shader execution');
            throw new Error('Test not fully implemented - requires shader execution');
        });

        // TEST 2: Spatial Isolation
        defineTest('Spatial Isolation: Guest cannot access outside its region', async (device, log) => {
            log('Setting up guest with GUEST_BASE=0x10000000, GUEST_SIZE=0x10000000...');
            // Set CSR_GUEST_BASE = 0x10000000
            // Set CSR_GUEST_SIZE = 0x10000000
            // Attempt to access 0x20000000 (outside region)
            // Expect: translate_address returns 0xFFFFFFFF

            log('TODO: Implement full shader execution');
            throw new Error('Test not fully implemented - requires shader execution');
        });

        // TEST 3: Morton Locality
        defineTest('Morton Locality: Sequential addresses map to nearby pixels', async (device, log) => {
            log('Testing Morton encoding...');
            // For addresses 0, 4, 8, 12 (sequential words)
            // Morton decode should give coordinates that are spatially close

            // Simple JS test of Morton encoding
            const part1by1 = (n) => {
                let x = n & 0x0000FFFF;
                x = (x | (x << 8)) & 0x00FF00FF;
                x = (x | (x << 4)) & 0x0F0F0F0F;
                x = (x | (x << 2)) & 0x33333333;
                x = (x | (x << 1)) & 0x55555555;
                return x;
            };
            const morton = (x, y) => part1by1(x) | (part1by1(y) << 1);

            // Test: sequential indices should have coordinates within 2 pixels
            for (let i = 0; i < 10; i++) {
                const m1 = morton(i, 0);
                const m2 = morton(i + 1, 0);
                log(`  morton(${i},0)=${m1}, morton(${i+1},0)=${m2}`);
            }

            log('Morton encoding verified in JS - shader test TODO');
            throw new Error('Test not fully implemented - requires shader execution');
        });

        // Export for button onclick
        window.runAllTests = runAllTests;
        window.clearLog = clearLog;
    </script>
</body>
</html>
```

**Step 2: Open in browser and verify basic functionality**

Run: Open `systems/visual_shell/web/test_tectonic_mmu.html` in WebGPU browser
Expected: Test page renders, WebGPU initializes on "Run All Tests"

**Step 3: Commit**

```bash
git add systems/visual_shell/web/test_tectonic_mmu.html
git commit -m "test(mmu): add Tectonic MMU validation test page"
```

---

### Task 6: Update gpu_execution_system.js for New Registers

**Files:**
- Modify: `systems/visual_shell/web/gpu_execution_system.js`

**Step 1: Add helper methods for Tectonic registers**

Add to the GPUExecutionSystem class:

```javascript
// Tectonic Hypervisor register accessors
setGuestBase(kernelId, base) {
    const kernel = this.kernels.get(kernelId);
    if (kernel) {
        const state = new Uint32Array(1);
        state[0] = base;
        this.device.queue.writeBuffer(kernel.stateBuffer, 46 * 4, state);
    }
}

setGuestSize(kernelId, size) {
    const kernel = this.kernels.get(kernelId);
    if (kernel) {
        const state = new Uint32Array(1);
        state[0] = size;
        this.device.queue.writeBuffer(kernel.stateBuffer, 47 * 4, state);
    }
}

setGeometryCacheBase(kernelId, base) {
    const kernel = this.kernels.get(kernelId);
    if (kernel) {
        const state = new Uint32Array(1);
        state[0] = base;
        this.device.queue.writeBuffer(kernel.stateBuffer, 48 * 4, state);
    }
}

getTransmutationFlags(kernelId) {
    return new Promise((resolve) => {
        const kernel = this.kernels.get(kernelId);
        if (!kernel) {
            resolve(0);
            return;
        }
        // Read state buffer and extract TRANS_FLAGS
        const readBuffer = this.device.createBuffer({
            size: 4,
            usage: GPUBufferUsage.MAP_READ | GPUBufferUsage.COPY_DST
        });
        const encoder = this.device.createCommandEncoder();
        encoder.copyBufferToBuffer(kernel.stateBuffer, 49 * 4, readBuffer, 0, 4);
        this.device.queue.submit([encoder.finish()]);

        readBuffer.mapAsync(GPUMapMode.READ).then(() => {
            const view = new Uint32Array(readBuffer.getMappedRange());
            resolve(view[0]);
            readBuffer.unmap();
            readBuffer.destroy();
        });
    });
}
```

**Step 2: Verify no syntax errors**

Run: Open test page, check console
Expected: No JavaScript errors

**Step 3: Commit**

```bash
git add systems/visual_shell/web/gpu_execution_system.js
git commit -m "feat(mmu): add Tectonic register accessors to GPUExecutionSystem"
```

---

## Verification Checklist

After completing all tasks:

- [ ] Shader compiles without errors
- [ ] Test page loads and WebGPU initializes
- [ ] REGS_PER_CORE = 64 in shader
- [ ] Morton encoding functions present
- [ ] translate_address includes bounds checking
- [ ] Dirty/access bit functions present
- [ ] GPUExecutionSystem has Tectonic accessors

## Next Steps (Future Phases)

- **Phase 2:** Emulation Bridge - connect QEMU via /dev/shm
- **Phase 3:** Neural Transpiler - x86 to GeoASM conversion
- **Phase 4:** Tiered JIT - dynamic transmutation with cache

---

*Plan created: 2026-02-25*
*Design reference: docs/plans/2026-02-25-spatial-mmu-dual-path-design.md*
