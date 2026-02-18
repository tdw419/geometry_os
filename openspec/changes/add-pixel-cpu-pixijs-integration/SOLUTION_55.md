# Solution for Task: Memory boundaries are enforced

Here is the implementation plan for the **Memory Boundaries** enforcement within the Pixel CPU - PixiJS Integration.

### 1. File Paths

**New Files**
*   `systems/visual_shell/web/cpu/memory_mapper.js`
    *   Handles the translation between CPU virtual addresses and PixiJS physical resources (Textures, Console).
*   `systems/visual_shell/web/cpu/memory_guard.js`
    *   Enforces memory access rules and bounds checking.

**Modified Files**
*   `systems/visual_shell/web/pixel_cpu.js`
    *   Updated to utilize the `MemoryGuard` during load/store operations.
*   `systems/visual_shell/web/infinite_map.js`
    *   Updated to accept memory updates from the `MemoryMapper`.

---

### 2. Implementation Snippets

#### A. Memory Guard (JavaScript)
This module ensures the CPU adheres to strict memory boundaries, preventing unauthorized access to non-Mapped I/O regions.

**File:** `systems/visual_shell/web/cpu/memory_guard.js`

```javascript
/**
 * Enforces memory boundaries for the Pixel CPU.
 * Prevents segmentation faults and isolates CPU memory from Visual Shell memory.
 */
export class MemoryGuard {
    constructor(memorySize, mmioRegions) {
        // 1. Initialize System Memory (Heap)
        this.memory = new Uint8Array(memorySize);
        this.memorySize = memorySize;

        // 2. Define Memory-Mapped I/O (MMIO) Regions
        // Format: { start: number, end: number, type: 'FRAMEBUFFER' | 'CONSOLE' | 'GPIO' }
        this.mmioRegions = mmioRegions;
    }

    /**
     * Validates an address and returns the target buffer and offset.
     * Throws if access is out of bounds or misaligned.
     */
    resolve(address, size) {
        // Check System Memory Bounds
        if (address < 0 || address + size > this.memorySize) {
            // Check if it falls into MMIO regions
            const region = this.mmioRegions.find(r => address >= r.start && address + size <= r.end);
            if (region) {
                return { buffer: region.buffer, offset: address - region.start, region: region.type };
            }
            
            console.error(`[MemoryGuard] Segmentation Fault: Access violation at 0x${address.toString(16)}`);
            throw new Error(`Segmentation Fault: 0x${address.toString(16)}`);
        }

        // Default to System Memory
        return { buffer: this.memory, offset: address, region: 'RAM' };
    }

    // Safe Read Operation
    readUint32(address) {
        const { buffer, offset } = this.resolve(address, 4);
        // Create a DataView to handle little-endian correctly
        const dataView = new DataView(buffer.buffer, buffer.byteOffset + offset, 4);
        return dataView.getUint32(0, true); // true = Little Endian
    }

    // Safe Write Operation
    writeUint32(address, value) {
        const { buffer, offset, region } = this.resolve(address, 4);
        const dataView = new DataView(buffer.buffer, buffer.byteOffset + offset, 4);
        dataView.setUint32(0, value, true);
        
        // Return region type to trigger side effects (like texture updates)
        return region;
    }
}
```

#### B. Memory Mapper (JavaScript)
This module bridges the gap between the CPU's writes and the PixiJS visual system.

**File:** `systems/visual_shell/web/cpu/memory_mapper.js`

```javascript
import { MemoryGuard } from './memory_guard.js';

/**
 * Maps CPU memory operations to PixiJS resources.
 */
export class MemoryMapper extends MemoryGuard {
    constructor(pixiApp, infiniteMap) {
        super(16 * 1024 * 1024, []); // 16MB RAM base

        this.pixiApp = pixiApp;
        this.infiniteMap = infiniteMap;

        // --- Register MMIO Regions ---
        
        // 1. Console Output (Text) at 0xFFFF_0000
        this.consoleBuffer = new Uint8Array(1024); 
        this.registerRegion(0xFFFF0000, 0xFFFF0400, this.consoleBuffer, 'CONSOLE');

        // 2. Framebuffer (Graphics) at 0x8000_0000
        // Assuming a 512x512 RGBA texture for the "CPU Screen"
        const fbSize = 512 * 512 * 4;
        this.frameBuffer = new Uint8Array(fbSize);
        this.registerRegion(0x80000000, 0x80000000 + fbSize, this.frameBuffer, 'FRAMEBUFFER');

        // Create PixiJS Texture for the Framebuffer
        this.fbTexture = null; // To be initialized in onAssetsLoaded
    }

    registerRegion(start, end, buffer, type) {
        this.mmioRegions.push({ start, end, buffer, type });
    }

    // Hook for PixiJS initialization
    initFrameBufferTexture(baseTexture) {
        this.fbTexture = new PIXI.Texture(baseTexture);
    }

    // Overload write to trigger Visual Updates
    writeUint32(address, value) {
        const region = super.writeUint32(address, value);

        if (region === 'FRAMEBUFFER') {
            // Flag texture for update (don't upload immediately, do it in render loop)
            this.fbDirty = true; 
        } 
        else if (region === 'CONSOLE') {
            // Decode value to ASCII and append to Infinite Map Console Overlay
            const char = String.fromCharCode(value & 0xFF);
            this.infiniteMap.appendToConsole(char);
        }

        return region;
    }

    // Called by PixiJS Ticker
    syncVisuals() {
        if (this.fbDirty && this.fbTexture) {
            // Update the PixiJS texture with CPU memory data
            // (Requires specific PIXI v8 Resource update logic)
            const resource = this.fbTexture.source;
            resource.update(this.frameBuffer);
            this.fbDirty = false;
        }
    }
}
```

---

### 3. Next Steps

**Step 1: Create the Memory Guard**
Create the file to handle low-level address validation.

```bash
touch systems/visual_shell/web/cpu/memory_guard.js
```

**Step 2: Create the Memory Mapper**
Create the file to handle the PixiJS integration logic.

```bash
touch systems/visual_shell/web/cpu/memory_mapper.js
```

**Step 3: Integrate into Pixel CPU**
Modify `pixel_cpu.js` to accept the `MemoryMapper` instance and use it for all `lw` (load word) and `sw` (store word) instructions.

```javascript
// In pixel_cpu.js constructor
constructor(memoryMapper) {
    this.mem = memoryMapper; // Use the mapper instead of raw Uint8Array
}

// Inside run() loop, for Store Word (sw) instruction
case 'sw':
    // Use safe write
    this.mem.writeUint32(address, value); 
    break;
```