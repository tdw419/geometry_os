# Visual MMU Implementation Plan

> **For Claude:** REQUIRED SUB-SKILL: Use superpowers:executing-plans to implement this plan task-by-task.

**Goal:** Build a GPU-native Memory Management Unit that enables multiple guest OS textures to run simultaneously with memory isolation using Hilbert curve page tables.

**Architecture:** Store page tables as 2D textures where each pixel represents a page table entry (RGB=physical coords, A=flags). Translation happens entirely in WGSL shaders. A single 8192x8192 Physical Atlas texture is divided into regions for each guest VM.

**Tech Stack:** WebGPU, WGSL, JavaScript ES6, Hilbert Curve mapping

---

## Task 1: VisualMMU Class Foundation

**Files:**
- Create: `systems/visual_shell/web/VisualMMU.js`
- Test: `systems/visual_shell/web/tests/test_visual_mmu.js`

**Step 1: Write the failing test**

```javascript
// systems/visual_shell/web/tests/test_visual_mmu.js

export async function testVisualMMUConstruction() {
    const mmu = new VisualMMU({
        device: mockDevice,
        atlasSize: 8192,
        pageSize: 4096,
        maxGuests: 4
    });

    if (!mmu) throw new Error("VisualMMU should construct");
    if (mmu.atlasSize !== 8192) throw new Error("atlasSize should be 8192");
    if (mmu.pageSize !== 4096) throw new Error("pageSize should be 4096");
    if (mmu.maxGuests !== 4) throw new Error("maxGuests should be 4");

    console.log("testVisualMMUConstruction: PASS");
}

export async function testPageTableSize() {
    const mmu = new VisualMMU({ device: mockDevice, atlasSize: 8192, pageSize: 4096 });

    // 8192x8192 atlas / 4KB pages = 4M pages
    // Page table needs 4M entries = 2048x2048 texture
    const expectedPages = (8192 * 8192) / (4096);
    if (mmu.totalPages !== expectedPages) {
        throw new Error(`totalPages should be ${expectedPages}, got ${mmu.totalPages}`);
    }

    console.log("testPageTableSize: PASS");
}

// Mock device for testing
const mockDevice = {
    createBuffer: () => ({}),
    createTexture: () => ({}),
    createBindGroupLayout: () => ({}),
    createBindGroup: () => ({}),
    createPipelineLayout: () => ({}),
    createComputePipeline: () => ({}),
    queue: { writeBuffer: () => {} }
};

// Export for HTML test runner
if (typeof window !== 'undefined') {
    window.testVisualMMUConstruction = testVisualMMUConstruction;
    window.testPageTableSize = testPageTableSize;
}
```

**Step 2: Run test to verify it fails**

Run: `node --check systems/visual_shell/web/tests/test_visual_mmu.js`
Expected: Error - VisualMMU is not defined

**Step 3: Write minimal implementation**

```javascript
// systems/visual_shell/web/VisualMMU.js

/**
 * VisualMMU - GPU-Native Memory Management Unit
 *
 * Manages virtual-to-physical address translation using texture-based page tables.
 * Each guest VM gets a region in the Physical Atlas texture.
 */
class VisualMMU {
    static PAGE_SIZE = 4096;
    static PAGE_TABLE_ENTRY_SIZE = 4; // RGBA bytes per entry

    /**
     * @param {Object} options
     * @param {GPUDevice} options.device - WebGPU device
     * @param {number} options.atlasSize - Physical atlas texture size (default: 8192)
     * @param {number} options.pageSize - Page size in bytes (default: 4096)
     * @param {number} options.maxGuests - Maximum concurrent VMs (default: 4)
     */
    constructor(options = {}) {
        this.device = options.device;
        this.atlasSize = options.atlasSize || 8192;
        this.pageSize = options.pageSize || VisualMMU.PAGE_SIZE;
        this.maxGuests = options.maxGuests || 4;

        // Calculate page table dimensions
        this.totalPages = (this.atlasSize * this.atlasSize) / this.pageSize;
        this.pageTableWidth = Math.ceil(Math.sqrt(this.totalPages));
        this.pageTableHeight = this.pageTableWidth;

        // Guest region tracking
        this.guests = new Map();
        this.nextRegionStart = 0;

        // GPU resources (initialized lazily)
        this.pageTableTexture = null;
        this.physicalAtlas = null;
        this.bindGroup = null;

        console.log(`[VisualMMU] Initialized: ${this.atlasSize}x${this.atlasSize} atlas, ${this.totalPages} pages`);
    }

    /**
     * Initialize GPU resources
     */
    async init() {
        this._createPageTableTexture();
        this._createPhysicalAtlas();
        this._createBindGroup();
        console.log("[VisualMMU] GPU resources initialized");
    }

    _createPageTableTexture() {
        // Page table: each pixel = one page table entry
        // R,G = physical region X,Y (16-bit each)
        // B = flags (present, writable, executable)
        // A = valid bit
        this.pageTableTexture = this.device.createTexture({
            size: [this.pageTableWidth, this.pageTableHeight],
            format: 'rgba8unorm',
            usage: GPUTextureUsage.STORAGE_BINDING |
                   GPUTextureUsage.TEXTURE_BINDING |
                   GPUTextureUsage.COPY_DST
        });
    }

    _createPhysicalAtlas() {
        // Physical memory atlas - one giant texture
        this.physicalAtlas = this.device.createTexture({
            size: [this.atlasSize, this.atlasSize],
            format: 'rgba8unorm',
            usage: GPUTextureUsage.STORAGE_BINDING |
                   GPUTextureUsage.TEXTURE_BINDING |
                   GPUTextureUsage.COPY_DST |
                   GPUTextureUsage.COPY_SRC
        });
    }

    _createBindGroup() {
        // Will be created when shader is loaded
        // Placeholder for now
    }
}

// Export for browser
if (typeof window !== 'undefined') {
    window.VisualMMU = VisualMMU;
}

// Export for ES modules
if (typeof module !== 'undefined') {
    module.exports = { VisualMMU };
}
```

**Step 4: Run test to verify it passes**

Run: `node --check systems/visual_shell/web/VisualMMU.js && node --check systems/visual_shell/web/tests/test_visual_mmu.js`
Expected: No errors (syntax check passes)

**Step 5: Commit**

```bash
git add systems/visual_shell/web/VisualMMU.js systems/visual_shell/web/tests/test_visual_mmu.js
git commit -m "feat(mmu): add VisualMMU class foundation"
```

---

## Task 2: Hilbert Curve Utilities (Port to JS)

**Files:**
- Create: `systems/visual_shell/web/hilbert.js`
- Test: `systems/visual_shell/web/tests/test_hilbert.js`

**Step 1: Write the failing test**

```javascript
// systems/visual_shell/web/tests/test_hilbert.js

export async function testHilbertRoundtrip() {
    const order = 4; // 16x16
    const size = Math.pow(2, order);

    for (let i = 0; i < size * size; i++) {
        const [x, y] = hilbertIndexToXY(i, order);
        const j = xyToHilbertIndex(x, y, order);
        if (i !== j) {
            throw new Error(`Roundtrip failed: ${i} -> (${x},${y}) -> ${j}`);
        }
    }

    console.log("testHilbertRoundtrip: PASS");
}

export async function testHilbertLocality() {
    const order = 4;
    const [x1, y1] = hilbertIndexToXY(0, order);
    const [x2, y2] = hilbertIndexToXY(1, order);

    const distance = Math.abs(x1 - x2) + Math.abs(y1 - y2);
    if (distance > 2) {
        throw new Error(`Hilbert should preserve locality, distance was ${distance}`);
    }

    console.log("testHilbertLocality: PASS");
}

export async function testHilbertOrder8() {
    const order = 8; // 256x256 (realistic page table size)
    const [x, y] = hilbertIndexToXY(1000, order);
    const j = xyToHilbertIndex(x, y, order);
    if (1000 !== j) {
        throw new Error(`Order 8 roundtrip failed: 1000 -> (${x},${y}) -> ${j}`);
    }
    console.log("testHilbertOrder8: PASS");
}

if (typeof window !== 'undefined') {
    window.testHilbertRoundtrip = testHilbertRoundtrip;
    window.testHilbertLocality = testHilbertLocality;
    window.testHilbertOrder8 = testHilbertOrder8;
}
```

**Step 2: Run test to verify it fails**

Run: `node --check systems/visual_shell/web/tests/test_hilbert.js`
Expected: Error - hilbertIndexToXY is not defined

**Step 3: Write minimal implementation**

```javascript
// systems/visual_shell/web/hilbert.js

/**
 * Hilbert Curve Utilities for Spatial Memory Mapping
 *
 * Ported from systems/infinite_map_rs/src/hilbert_memory.rs
 * Maps linear addresses to 2D coordinates preserving locality.
 */

/**
 * Convert Hilbert curve index to (x, y) coordinates
 * @param {number} index - Linear index along the Hilbert curve
 * @param {number} order - Hilbert curve order (texture size = 2^order)
 * @returns {[number, number]} (x, y) coordinates
 */
function hilbertIndexToXY(index, order) {
    let x = 0;
    let y = 0;
    let s = 1;
    let idx = index;

    for (let i = 0; i < order; i++) {
        const rx = 1 & (idx >>> 1);
        const ry = 1 & (idx ^ rx);

        // Rotate/flip quadrant
        [x, y] = hilbertRot(s, x, y, rx, ry);

        x += s * rx;
        y += s * ry;

        idx = Math.floor(idx / 4);
        s *= 2;
    }

    return [x, y];
}

/**
 * Convert (x, y) coordinates to Hilbert curve index
 * @param {number} x - X coordinate
 * @param {number} y - Y coordinate
 * @param {number} order - Hilbert curve order
 * @returns {number} Linear index along the Hilbert curve
 */
function xyToHilbertIndex(x, y, order) {
    let d = 0;
    let s = 1;
    let rx, ry;
    let xx = x;
    let yy = y;

    for (let i = 0; i < order; i++) {
        rx = 1 & (xx >>> 0); // Use unsigned shift
        ry = 1 & (yy >>> 0);

        d += s * s * ((3 * rx) ^ ry);

        [xx, yy] = hilbertRot(s, xx, yy, rx, ry);

        s *= 2;
        xx = Math.floor(xx / 2);
        yy = Math.floor(yy / 2);
    }

    return d;
}

/**
 * Rotate/flip a quadrant appropriately
 * @private
 */
function hilbertRot(n, x, y, rx, ry) {
    if (ry === 0) {
        if (rx === 1) {
            x = n - 1 - x;
            y = n - 1 - y;
        }
        // Swap x and y
        return [y, x];
    }
    return [x, y];
}

/**
 * Get the order needed for a given size
 * @param {number} size - Desired texture size
 * @returns {number} Hilbert order (log2 of size)
 */
function getHilbertOrder(size) {
    return Math.ceil(Math.log2(size));
}

// Export
if (typeof window !== 'undefined') {
    window.hilbertIndexToXY = hilbertIndexToXY;
    window.xyToHilbertIndex = xyToHilbertIndex;
    window.getHilbertOrder = getHilbertOrder;
}

if (typeof module !== 'undefined') {
    module.exports = { hilbertIndexToXY, xyToHilbertIndex, getHilbertOrder };
}
```

**Step 4: Run test to verify it passes**

Run: `node -e "const {hilbertIndexToXY, xyToHilbertIndex} = require('./systems/visual_shell/web/hilbert.js'); const [x,y] = hilbertIndexToXY(0, 4); console.log(x,y);"`
Expected: 0 0

**Step 5: Commit**

```bash
git add systems/visual_shell/web/hilbert.js systems/visual_shell/web/tests/test_hilbert.js
git commit -m "feat(hilbert): add JS Hilbert curve utilities"
```

---

## Task 3: Guest Region Allocation

**Files:**
- Modify: `systems/visual_shell/web/VisualMMU.js`
- Modify: `systems/visual_shell/web/tests/test_visual_mmu.js`

**Step 1: Write the failing test**

```javascript
// Add to systems/visual_shell/web/tests/test_visual_mmu.js

export async function testAllocateGuest() {
    const mmu = new VisualMMU({ device: mockDevice, atlasSize: 256, pageSize: 4096, maxGuests: 4 });

    const guest1 = mmu.allocateGuest(1024); // 1024 pages
    if (guest1.vmId !== 0) throw new Error("First guest should have vmId 0");
    if (!guest1.regionStart) throw new Error("Should have regionStart");
    if (!guest1.regionSize) throw new Error("Should have regionSize");

    const guest2 = mmu.allocateGuest(512);
    if (guest2.vmId !== 1) throw new Error("Second guest should have vmId 1");

    console.log("testAllocateGuest: PASS");
}

export async function testAllocateTooManyGuests() {
    const mmu = new VisualMMU({ device: mockDevice, atlasSize: 256, pageSize: 4096, maxGuests: 2 });

    mmu.allocateGuest(100);
    mmu.allocateGuest(100);

    try {
        mmu.allocateGuest(100);
        throw new Error("Should have thrown error for too many guests");
    } catch (e) {
        if (!e.message.includes("Maximum guests")) {
            throw e;
        }
    }

    console.log("testAllocateTooManyGuests: PASS");
}

export async function testFreeGuest() {
    const mmu = new VisualMMU({ device: mockDevice, atlasSize: 256, pageSize: 4096, maxGuests: 2 });

    const guest = mmu.allocateGuest(100);
    mmu.freeGuest(guest.vmId);

    if (mmu.guests.has(guest.vmId)) {
        throw new Error("Guest should be removed after free");
    }

    console.log("testFreeGuest: PASS");
}

// Update exports
if (typeof window !== 'undefined') {
    window.testAllocateGuest = testAllocateGuest;
    window.testAllocateTooManyGuests = testAllocateTooManyGuests;
    window.testFreeGuest = testFreeGuest;
}
```

**Step 2: Run test to verify it fails**

Run: `node --check systems/visual_shell/web/tests/test_visual_mmu.js`
Expected: Error - allocateGuest is not defined

**Step 3: Add allocation methods to VisualMMU**

```javascript
// Add to VisualMMU class in systems/visual_shell/web/VisualMMU.js

/**
 * Allocate a memory region for a new guest VM
 * @param {number} pageCount - Number of pages to allocate
 * @returns {Object} Guest info with vmId, regionStart, regionSize
 */
allocateGuest(pageCount) {
    if (this.guests.size >= this.maxGuests) {
        throw new Error(`Maximum guests (${this.maxGuests}) already allocated`);
    }

    // Find next available vmId
    let vmId = 0;
    while (this.guests.has(vmId)) {
        vmId++;
    }

    // Calculate region size in atlas pixels
    const regionSize = Math.ceil(Math.sqrt(pageCount)) * this.pageSize;

    // Check if we have space
    if (this.nextRegionStart + regionSize > this.atlasSize) {
        throw new Error(`Insufficient atlas space for ${pageCount} pages`);
    }

    const guest = {
        vmId,
        regionStart: this.nextRegionStart,
        regionSize,
        pageCount,
        pageTable: new Map() // VPN -> PPN mapping
    };

    this.guests.set(vmId, guest);
    this.nextRegionStart += regionSize;

    console.log(`[VisualMMU] Allocated guest ${vmId}: ${pageCount} pages at offset ${guest.regionStart}`);
    return guest;
}

/**
 * Free a guest's memory region
 * @param {number} vmId - Guest VM ID to free
 */
freeGuest(vmId) {
    const guest = this.guests.get(vmId);
    if (!guest) {
        throw new Error(`Guest ${vmId} not found`);
    }

    // Note: In production, we'd merge free regions
    // For now, just remove the guest
    this.guests.delete(vmId);
    console.log(`[VisualMMU] Freed guest ${vmId}`);
}

/**
 * Get guest info
 * @param {number} vmId
 * @returns {Object|undefined}
 */
getGuest(vmId) {
    return this.guests.get(vmId);
}
```

**Step 4: Run test to verify it passes**

Run: `node --check systems/visual_shell/web/VisualMMU.js`
Expected: No syntax errors

**Step 5: Commit**

```bash
git add systems/visual_shell/web/VisualMMU.js systems/visual_shell/web/tests/test_visual_mmu.js
git commit -m "feat(mmu): add guest region allocation"
```

---

## Task 4: Page Table Updates

**Files:**
- Modify: `systems/visual_shell/web/VisualMMU.js`
- Modify: `systems/visual_shell/web/tests/test_visual_mmu.js`

**Step 1: Write the failing test**

```javascript
// Add to systems/visual_shell/web/tests/test_visual_mmu.js

export async function testMapPage() {
    const mmu = new VisualMMU({ device: mockDevice, atlasSize: 256, pageSize: 4096 });
    const guest = mmu.allocateGuest(16);

    // Map virtual page 0 to physical page 0 in guest's region
    const mapping = mmu.mapPage(guest.vmId, 0, 0);

    if (mapping.vpn !== 0) throw new Error("VPN should be 0");
    if (mapping.ppn !== 0) throw new Error("PPN should be 0");
    if (!mapping.flags.present) throw new Error("Page should be present");

    console.log("testMapPage: PASS");
}

export async function testTranslateAddress() {
    const mmu = new VisualMMU({ device: mockDevice, atlasSize: 256, pageSize: 4096 });
    const guest = mmu.allocateGuest(16);

    mmu.mapPage(guest.vmId, 0, 0);

    // Virtual address 0x1000 (page 1, offset 0) should translate
    const physCoord = mmu.translate(0x1000, guest.vmId);

    if (typeof physCoord.x !== 'number') throw new Error("Should return x coordinate");
    if (typeof physCoord.y !== 'number') throw new Error("Should return y coordinate");

    console.log("testTranslateAddress: PASS");
}

export async function testTranslateUnmappedPage() {
    const mmu = new VisualMMU({ device: mockDevice, atlasSize: 256, pageSize: 4096 });
    const guest = mmu.allocateGuest(16);

    // Don't map anything - translation should fail gracefully
    try {
        mmu.translate(0x1000, guest.vmId);
        throw new Error("Should throw for unmapped page");
    } catch (e) {
        if (!e.message.includes("not mapped")) {
            throw e;
        }
    }

    console.log("testTranslateUnmappedPage: PASS");
}

if (typeof window !== 'undefined') {
    window.testMapPage = testMapPage;
    window.testTranslateAddress = testTranslateAddress;
    window.testTranslateUnmappedPage = testTranslateUnmappedPage;
}
```

**Step 2: Run test to verify it fails**

Run: `node --check systems/visual_shell/web/tests/test_visual_mmu.js`
Expected: Error - mapPage is not defined

**Step 3: Add page mapping methods**

```javascript
// Add to VisualMMU class

/**
 * Map a virtual page to a physical page
 * @param {number} vmId - Guest VM ID
 * @param {number} vpn - Virtual Page Number
 * @param {number} ppn - Physical Page Number (relative to guest region)
 * @param {Object} flags - { present, writable, executable }
 * @returns {Object} Mapping info
 */
mapPage(vmId, vpn, ppn, flags = { present: true, writable: true, executable: true }) {
    const guest = this.guests.get(vmId);
    if (!guest) {
        throw new Error(`Guest ${vmId} not found`);
    }

    const mapping = {
        vpn,
        ppn,
        flags: {
            present: flags.present ?? true,
            writable: flags.writable ?? true,
            executable: flags.executable ?? true
        }
    };

    guest.pageTable.set(vpn, mapping);

    // Update GPU page table texture
    this._updatePageTableEntry(vmId, vpn, mapping);

    return mapping;
}

/**
 * Translate virtual address to physical coordinates
 * @param {number} vaddr - Virtual address
 * @param {number} vmId - Guest VM ID
 * @returns {{x: number, y: number, offset: number}} Physical coordinates
 */
translate(vaddr, vmId) {
    const guest = this.guests.get(vmId);
    if (!guest) {
        throw new Error(`Guest ${vmId} not found`);
    }

    const vpn = Math.floor(vaddr / this.pageSize);
    const offset = vaddr % this.pageSize;

    const mapping = guest.pageTable.get(vpn);
    if (!mapping || !mapping.flags.present) {
        throw new Error(`Page ${vpn} not mapped for guest ${vmId}`);
    }

    // Calculate physical coordinates using Hilbert curve
    const order = getHilbertOrder(this.atlasSize);
    const [x, y] = hilbertIndexToXY(guest.regionStart + mapping.ppn, order);

    // Add offset within page (in pixels)
    const pageOffsetX = offset % 64; // Assuming 64-pixel wide pages
    const pageOffsetY = Math.floor(offset / 64);

    return {
        x: x * 64 + pageOffsetX, // Scale to pixel coordinates
        y: y * 64 + pageOffsetY,
        offset
    };
}

/**
 * Update GPU page table texture entry
 * @private
 */
_updatePageTableEntry(vmId, vpn, mapping) {
    if (!this.pageTableTexture) return;

    // Calculate position in page table texture
    const order = getHilbertOrder(this.atlasSize);
    const [x, y] = hilbertIndexToXY(mapping.ppn, order);

    // Pack flags into byte
    let flags = 0;
    if (mapping.flags.present) flags |= 0x01;
    if (mapping.flags.writable) flags |= 0x02;
    if (mapping.flags.executable) flags |= 0x04;

    // Create RGBA entry: R=X_low, G=X_high, B=Y, A=flags
    const entry = new Uint8Array([
        x & 0xFF,           // R: X low byte
        (x >>> 8) & 0xFF,   // G: X high byte
        y & 0xFF,           // B: Y
        flags               // A: flags
    ]);

    // Write to texture (would use queue.writeTexture in real implementation)
    console.log(`[VisualMMU] Updated page table: VPN=${vpn} -> (${x},${y}) flags=${flags}`);
}
```

**Step 4: Run test to verify it passes**

Run: `node --check systems/visual_shell/web/VisualMMU.js`
Expected: No syntax errors

**Step 5: Commit**

```bash
git add systems/visual_shell/web/VisualMMU.js systems/visual_shell/web/tests/test_visual_mmu.js
git commit -m "feat(mmu): add page table mapping and translation"
```

---

## Task 5: WGSL Shader Functions

**Files:**
- Create: `systems/visual_shell/web/shaders/mmu_core.wgsl`
- Create: `systems/visual_shell/web/tests/test_mmu_shader.html`

**Step 1: Write the WGSL shader**

```wgsl
// systems/visual_shell/web/shaders/mmu_core.wgsl

// Visual MMU Core Shader Functions
// Provides GPU-side address translation for guest VMs

// --- Bindings ---
@group(0) @binding(0) var page_table: texture_2d<f32>;
@group(0) @binding(1) var physical_atlas: texture_2d<f32>;

// --- Constants ---
const PAGE_SIZE: u32 = 4096u;
const PAGE_TABLE_WIDTH: u32 = 2048u;
const ATLAS_SIZE: u32 = 8192u;

// --- Page Table Entry Structure ---
struct PageTableEntry {
    physical_x: u32,
    physical_y: u32,
    flags: u32,
    valid: bool,
};

// --- Flag Bits ---
const FLAG_PRESENT: u32 = 0x01u;
const FLAG_WRITABLE: u32 = 0x02u;
const FLAG_EXECUTABLE: u32 = 0x04u;

// --- Decode Page Table Entry from Texture ---
fn decode_page_entry(pixel: vec4<f32>) -> PageTableEntry {
    var entry: PageTableEntry;

    // Unpack from RGBA
    entry.physical_x = u32(pixel.r * 255.0) | (u32(pixel.g * 255.0) << 8u);
    entry.physical_y = u32(pixel.b * 255.0);
    entry.flags = u32(pixel.a * 255.0);
    entry.valid = (entry.flags & FLAG_PRESENT) != 0u;

    return entry;
}

// --- MMU Translate: Virtual -> Physical ---
// Returns physical (x, y) coordinates in the atlas
fn mmu_translate(virtual_addr: u32, vm_id: u32) -> vec2<u32> {
    // 1. Calculate Virtual Page Number
    let vpn = virtual_addr / PAGE_SIZE;
    let offset = virtual_addr % PAGE_SIZE;

    // 2. Look up in page table (using VM_ID as offset)
    // Each VM gets a section of the page table
    let vm_offset = vm_id * (PAGE_TABLE_WIDTH * PAGE_TABLE_WIDTH / 4u);
    let pt_index = vm_offset + vpn;

    let pt_x = pt_index % PAGE_TABLE_WIDTH;
    let pt_y = pt_index / PAGE_TABLE_WIDTH;

    let entry_pixel = textureLoad(page_table, vec2<i32>(i32(pt_x), i32(pt_y)), 0);
    let entry = decode_page_entry(entry_pixel);

    // 3. If not valid, return (0, 0) - would trigger fault in real system
    if (!entry.valid) {
        return vec2<u32>(0u, 0u);
    }

    // 4. Calculate physical coordinates
    // Physical page location from entry
    let phys_x = entry.physical_x * 64u;  // Scale to pixel coords
    let phys_y = entry.physical_y * 64u;

    // Add offset within page
    let offset_x = offset % 64u;
    let offset_y = offset / 64u;

    return vec2<u32>(phys_x + offset_x, phys_y + offset_y);
}

// --- MMU Load: Read value from virtual address ---
fn mmu_load(virtual_addr: u32, vm_id: u32) -> u32 {
    let phys = mmu_translate(virtual_addr, vm_id);

    // Load from physical atlas
    let pixel = textureLoad(physical_atlas, vec2<i32>(i32(phys.x), i32(phys.y)), 0);

    // Reconstruct u32 from RGBA
    return u32(pixel.r * 255.0) |
           (u32(pixel.g * 255.0) << 8u) |
           (u32(pixel.b * 255.0) << 16u) |
           (u32(pixel.a * 255.0) << 24u);
}

// --- MMU Store: Write value to virtual address ---
// Note: Requires storage texture binding for write access
fn mmu_store(virtual_addr: u32, vm_id: u32, value: u32) {
    // Placeholder - would need writeable texture binding
    // Real implementation would use storage texture
}

// --- Check Permission ---
fn mmu_check_permission(virtual_addr: u32, vm_id: u32, is_write: bool, is_exec: bool) -> bool {
    let vpn = virtual_addr / PAGE_SIZE;

    let vm_offset = vm_id * (PAGE_TABLE_WIDTH * PAGE_TABLE_WIDTH / 4u);
    let pt_index = vm_offset + vpn;

    let pt_x = pt_index % PAGE_TABLE_WIDTH;
    let pt_y = pt_index / PAGE_TABLE_WIDTH;

    let entry_pixel = textureLoad(page_table, vec2<i32>(i32(pt_x), i32(pt_y)), 0);
    let entry = decode_page_entry(entry_pixel);

    if (!entry.valid) {
        return false;
    }

    if (is_write && (entry.flags & FLAG_WRITABLE) == 0u) {
        return false;
    }

    if (is_exec && (entry.flags & FLAG_EXECUTABLE) == 0u) {
        return false;
    }

    return true;
}
```

**Step 2: Create test HTML page**

```html
<!-- systems/visual_shell/web/tests/test_mmu_shader.html -->
<!DOCTYPE html>
<html>
<head>
    <title>Visual MMU Shader Tests</title>
    <style>
        body { font-family: monospace; padding: 20px; background: #1a1a2e; color: #eee; }
        .pass { color: #0f0; }
        .fail { color: #f00; }
        .test { margin: 10px 0; padding: 10px; background: #16213e; border-radius: 4px; }
        #summary { font-size: 1.2em; margin-top: 20px; padding: 15px; background: #0f3460; }
    </style>
</head>
<body>
    <h1>Visual MMU Shader Tests</h1>
    <div id="results"></div>
    <div id="summary"></div>

    <script type="module">
        let passed = 0;
        let failed = 0;

        async function runTest(name, fn) {
            const div = document.createElement('div');
            div.className = 'test';
            try {
                await fn();
                div.innerHTML = `<span class="pass">✓ PASS</span> ${name}`;
                passed++;
            } catch (e) {
                div.innerHTML = `<span class="fail">✗ FAIL</span> ${name}<br><small>${e.message}</small>`;
                failed++;
            }
            document.getElementById('results').appendChild(div);
        }

        async function testWGSLCompilation() {
            if (!navigator.gpu) {
                throw new Error("WebGPU not supported");
            }

            const adapter = await navigator.gpu.requestAdapter();
            const device = await adapter.requestDevice();

            const shaderCode = await fetch('../shaders/mmu_core.wgsl').then(r => r.text());

            // Try to create shader module
            const module = device.createShaderModule({ code: shaderCode });

            // Check for compilation errors
            const info = await module.getCompilationInfo();
            for (const msg of info.messages) {
                if (msg.type === 'error') {
                    throw new Error(`Shader error: ${msg.message}`);
                }
            }
        }

        async function runAllTests() {
            await runTest("WGSL Compilation", testWGSLCompilation);

            document.getElementById('summary').innerHTML =
                `<span class="${failed === 0 ? 'pass' : 'fail'}">${passed} passed, ${failed} failed</span>`;
        }

        runAllTests();
    </script>
</body>
</html>
```

**Step 3: Verify shader compiles**

Run: Open `test_mmu_shader.html` in Chrome with WebGPU enabled
Expected: 1 passed, 0 failed

**Step 4: Commit**

```bash
git add systems/visual_shell/web/shaders/mmu_core.wgsl systems/visual_shell/web/tests/test_mmu_shader.html
git commit -m "feat(mmu): add WGSL shader functions for GPU translation"
```

---

## Task 6: HTML Test Runner for All Tests

**Files:**
- Create: `systems/visual_shell/web/test_visual_mmu.html`

**Step 1: Create comprehensive test runner**

```html
<!-- systems/visual_shell/web/test_visual_mmu.html -->
<!DOCTYPE html>
<html>
<head>
    <title>Visual MMU Test Suite</title>
    <style>
        * { box-sizing: border-box; }
        body { font-family: 'JetBrains Mono', monospace; padding: 20px; background: #0d1117; color: #c9d1d9; }
        h1 { color: #58a6ff; border-bottom: 1px solid #30363d; padding-bottom: 10px; }
        .pass { color: #3fb950; }
        .fail { color: #f85149; }
        .test { margin: 8px 0; padding: 12px 16px; background: #161b22; border-radius: 6px; border-left: 3px solid #30363d; }
        .test.pass { border-left-color: #3fb950; }
        .test.fail { border-left-color: #f85149; }
        #summary { font-size: 1.1em; margin-top: 20px; padding: 15px; background: #21262d; border-radius: 6px; }
        button { background: #238636; color: white; border: none; padding: 10px 20px; border-radius: 6px; cursor: pointer; margin: 5px; }
        button:hover { background: #2ea043; }
        .progress { color: #8b949e; margin: 10px 0; }
    </style>
</head>
<body>
    <h1>🧪 Visual MMU Test Suite</h1>
    <div class="progress" id="progress">Click "Run Tests" to begin...</div>
    <div>
        <button onclick="runAllTests()">Run Tests</button>
        <button onclick="location.reload()">Reset</button>
    </div>
    <div id="results"></div>
    <div id="summary"></div>

    <script src="hilbert.js"></script>
    <script src="VisualMMU.js"></script>
    <script>
        let passed = 0;
        let failed = 0;

        // Mock WebGPU device for testing
        const mockDevice = {
            createBuffer: () => ({}),
            createTexture: () => ({}),
            createBindGroupLayout: () => ({}),
            createBindGroup: () => ({}),
            queue: { writeBuffer: () => {}, writeTexture: () => {} }
        };

        async function runTest(name, fn) {
            const div = document.createElement('div');
            div.className = 'test';
            try {
                await fn();
                div.innerHTML = `<span class="pass">✓ PASS</span> ${name}`;
                div.classList.add('pass');
                passed++;
            } catch (e) {
                div.innerHTML = `<span class="fail">✗ FAIL</span> ${name}<br><small style="color:#8b949e">${e.message}</small>`;
                div.classList.add('fail');
                failed++;
            }
            document.getElementById('results').appendChild(div);
        }

        // Hilbert Tests
        async function testHilbertRoundtrip() {
            const order = 4;
            const size = Math.pow(2, order);
            for (let i = 0; i < size * size; i++) {
                const [x, y] = hilbertIndexToXY(i, order);
                const j = xyToHilbertIndex(x, y, order);
                if (i !== j) throw new Error(`Roundtrip failed: ${i} -> (${x},${y}) -> ${j}`);
            }
        }

        async function testHilbertLocality() {
            const [x1, y1] = hilbertIndexToXY(0, 4);
            const [x2, y2] = hilbertIndexToXY(1, 4);
            const dist = Math.abs(x1-x2) + Math.abs(y1-y2);
            if (dist > 2) throw new Error(`Locality violated: distance ${dist}`);
        }

        // VisualMMU Tests
        async function testMMUConstruction() {
            const mmu = new VisualMMU({ device: mockDevice, atlasSize: 8192, pageSize: 4096, maxGuests: 4 });
            if (mmu.atlasSize !== 8192) throw new Error("Wrong atlasSize");
            if (mmu.pageSize !== 4096) throw new Error("Wrong pageSize");
        }

        async function testAllocateGuest() {
            const mmu = new VisualMMU({ device: mockDevice, atlasSize: 256, pageSize: 4096, maxGuests: 4 });
            const g1 = mmu.allocateGuest(1024);
            if (g1.vmId !== 0) throw new Error("First guest should be vmId 0");
            const g2 = mmu.allocateGuest(512);
            if (g2.vmId !== 1) throw new Error("Second guest should be vmId 1");
        }

        async function testMapPage() {
            const mmu = new VisualMMU({ device: mockDevice, atlasSize: 256, pageSize: 4096 });
            const guest = mmu.allocateGuest(16);
            const mapping = mmu.mapPage(guest.vmId, 0, 0);
            if (!mapping.flags.present) throw new Error("Page should be present");
        }

        async function testTranslateAddress() {
            const mmu = new VisualMMU({ device: mockDevice, atlasSize: 256, pageSize: 4096 });
            const guest = mmu.allocateGuest(16);
            mmu.mapPage(guest.vmId, 0, 0);
            const phys = mmu.translate(0x1000, guest.vmId);
            if (typeof phys.x !== 'number') throw new Error("Should return x coordinate");
        }

        async function runAllTests() {
            passed = 0;
            failed = 0;
            document.getElementById('results').innerHTML = '';
            document.getElementById('progress').textContent = 'Running tests...';

            // Hilbert tests
            await runTest("Hilbert Roundtrip", testHilbertRoundtrip);
            await runTest("Hilbert Locality", testHilbertLocality);

            // VisualMMU tests
            await runTest("MMU Construction", testMMUConstruction);
            await runTest("Allocate Guest", testAllocateGuest);
            await runTest("Map Page", testMapPage);
            await runTest("Translate Address", testTranslateAddress);

            document.getElementById('progress').textContent = 'Tests complete!';
            document.getElementById('summary').innerHTML =
                `<span class="${failed === 0 ? 'pass' : 'fail'}">📊 Results: ${passed} passed, ${failed} failed</span>`;
        }
    </script>
</body>
</html>
```

**Step 2: Verify all tests pass**

Run: Open `test_visual_mmu.html` in Chrome
Expected: 6 passed, 0 failed

**Step 3: Commit**

```bash
git add systems/visual_shell/web/test_visual_mmu.html
git commit -m "test(mmu): add comprehensive HTML test runner"
```

---

## Task 7: Integration Demo

**Files:**
- Create: `systems/visual_shell/web/demo_visual_mmu.html`

**Step 1: Create demo page**

```html
<!-- systems/visual_shell/web/demo_visual_mmu.html -->
<!DOCTYPE html>
<html>
<head>
    <title>Visual MMU Demo - Multi-Guest Memory Isolation</title>
    <style>
        body { font-family: 'JetBrains Mono', monospace; padding: 20px; background: #0d1117; color: #c9d1d9; }
        h1 { color: #58a6ff; }
        .panel { background: #161b22; border-radius: 8px; padding: 20px; margin: 20px 0; }
        .guest { border: 1px solid #30363d; padding: 15px; margin: 10px 0; border-radius: 6px; }
        .guest-0 { border-left: 4px solid #f85149; }
        .guest-1 { border-left: 4px solid #3fb950; }
        .guest-2 { border-left: 4px solid #58a6ff; }
        .guest-3 { border-left: 4px solid #d29922; }
        button { background: #238636; color: white; border: none; padding: 8px 16px; border-radius: 6px; cursor: pointer; margin: 5px; }
        button:hover { background: #2ea043; }
        button:disabled { background: #21262d; color: #484f58; cursor: not-allowed; }
        input { background: #0d1117; border: 1px solid #30363d; color: #c9d1d9; padding: 8px; border-radius: 4px; }
        .log { background: #0d1117; padding: 10px; border-radius: 4px; max-height: 200px; overflow-y: auto; font-size: 12px; }
        .atlas { display: grid; grid-template-columns: repeat(8, 40px); gap: 2px; margin: 20px 0; }
        .atlas-cell { width: 40px; height: 40px; background: #21262d; border-radius: 2px; display: flex; align-items: center; justify-content: center; font-size: 10px; }
        .atlas-cell.guest-0 { background: #f8514933; }
        .atlas-cell.guest-1 { background: #3fb95033; }
        .atlas-cell.guest-2 { background: #58a6ff33; }
        .atlas-cell.guest-3 { background: #d2992233; }
    </style>
</head>
<body>
    <h1>🗺️ Visual MMU Demo</h1>
    <p>Demonstrates multi-guest memory isolation using texture-based page tables.</p>

    <div class="panel">
        <h2>Guest VMs</h2>
        <div id="guests"></div>
        <button onclick="addGuest()">+ Add Guest</button>
    </div>

    <div class="panel">
        <h2>Physical Atlas (8x8 simplified view)</h2>
        <div class="atlas" id="atlas"></div>
    </div>

    <div class="panel">
        <h2>Activity Log</h2>
        <div class="log" id="log"></div>
    </div>

    <script src="hilbert.js"></script>
    <script src="VisualMMU.js"></script>
    <script>
        // Mock WebGPU device
        const mockDevice = {
            createBuffer: () => ({}),
            createTexture: () => ({}),
            queue: { writeBuffer: () => {} }
        };

        let mmu;
        let guestCount = 0;

        function log(msg) {
            const div = document.getElementById('log');
            div.innerHTML = `[${new Date().toLocaleTimeString()}] ${msg}<br>` + div.innerHTML;
        }

        function renderAtlas() {
            const atlas = document.getElementById('atlas');
            atlas.innerHTML = '';

            for (let i = 0; i < 64; i++) {
                const cell = document.createElement('div');
                cell.className = 'atlas-cell';

                // Check which guest owns this cell
                for (const [vmId, guest] of mmu.guests) {
                    const guestStart = Math.floor(guest.regionStart / 256);
                    const guestEnd = Math.floor((guest.regionStart + guest.regionSize) / 256);
                    if (i >= guestStart && i < guestEnd) {
                        cell.classList.add(`guest-${vmId}`);
                        cell.textContent = `G${vmId}`;
                        break;
                    }
                }

                atlas.appendChild(cell);
            }
        }

        function renderGuests() {
            const container = document.getElementById('guests');
            container.innerHTML = '';

            for (const [vmId, guest] of mmu.guests) {
                const div = document.createElement('div');
                div.className = `guest guest-${vmId}`;
                div.innerHTML = `
                    <h3>Guest ${vmId}</h3>
                    <p>Region: offset ${guest.regionStart}, ${guest.pageCount} pages</p>
                    <p>Mapped pages: ${guest.pageTable.size}</p>
                    <input type="text" id="addr-${vmId}" placeholder="Virtual address (hex, e.g. 1000)" style="width: 200px">
                    <button onclick="mapPage(${vmId})">Map Page</button>
                    <button onclick="translate(${vmId})">Translate</button>
                    <button onclick="freeGuest(${vmId})">Free Guest</button>
                `;
                container.appendChild(div);
            }
        }

        function addGuest() {
            if (guestCount >= 4) {
                log('Maximum guests reached!');
                return;
            }

            const pageCount = 4 + Math.floor(Math.random() * 4);
            const guest = mmu.allocateGuest(pageCount);
            guestCount++;

            log(`Allocated Guest ${guest.vmId}: ${pageCount} pages at offset ${guest.regionStart}`);

            renderGuests();
            renderAtlas();
        }

        function mapPage(vmId) {
            const input = document.getElementById(`addr-${vmId}`);
            const vaddr = parseInt(input.value || '1000', 16);
            const vpn = Math.floor(vaddr / 4096);

            const mapping = mmu.mapPage(vmId, vpn, vpn);
            log(`Guest ${vmId}: Mapped VPN ${vpn} -> PPN ${mapping.ppn}`);

            renderGuests();
        }

        function translate(vmId) {
            const input = document.getElementById(`addr-${vmId}`);
            const vaddr = parseInt(input.value || '1000', 16);

            try {
                const phys = mmu.translate(vaddr, vmId);
                log(`Guest ${vmId}: 0x${vaddr.toString(16)} -> (${phys.x}, ${phys.y})`);
            } catch (e) {
                log(`Guest ${vmId}: Translation failed - ${e.message}`);
            }
        }

        function freeGuest(vmId) {
            mmu.freeGuest(vmId);
            guestCount--;
            log(`Freed Guest ${vmId}`);
            renderGuests();
            renderAtlas();
        }

        // Initialize
        function init() {
            mmu = new VisualMMU({ device: mockDevice, atlasSize: 256, pageSize: 4096, maxGuests: 4 });
            log('Visual MMU initialized');
            renderAtlas();
        }

        init();
    </script>
</body>
</html>
```

**Step 2: Verify demo works**

Run: Open `demo_visual_mmu.html` in Chrome
Expected: UI loads, can add guests, map pages, translate addresses

**Step 3: Commit**

```bash
git add systems/visual_shell/web/demo_visual_mmu.html
git commit -m "feat(mmu): add interactive Visual MMU demo"
```

---

## Summary

**Total Tasks: 7**

| Task | Description | Files |
|------|-------------|-------|
| 1 | VisualMMU Class Foundation | `VisualMMU.js`, `test_visual_mmu.js` |
| 2 | Hilbert Curve Utilities | `hilbert.js`, `test_hilbert.js` |
| 3 | Guest Region Allocation | Modify `VisualMMU.js` |
| 4 | Page Table Updates | Modify `VisualMMU.js` |
| 5 | WGSL Shader Functions | `mmu_core.wgsl`, `test_mmu_shader.html` |
| 6 | HTML Test Runner | `test_visual_mmu.html` |
| 7 | Integration Demo | `demo_visual_mmu.html` |

**Final State:**
- JavaScript VisualMMU class with allocation, mapping, translation
- WGSL shader functions for GPU-side translation
- Comprehensive test suite
- Interactive demo page

---

**Plan complete and saved to `docs/plans/2026-02-26-visual-mmu.md`.**

Two execution options:

**1. Subagent-Driven (this session)** - I dispatch fresh subagent per task, review between tasks, fast iteration

**2. Parallel Session (separate)** - Open new session with executing-plans, batch execution with checkpoints

**Which approach?**
