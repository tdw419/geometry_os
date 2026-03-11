# Solution for Task: Scrolling works correctly

Here is the implementation plan for the **Pixel CPU - PixiJS Integration**.

This solution focuses on bridging the gap between the RISC-V emulator and the PixiJS visual layer using a **Memory-Mapped I/O (MMIO)** strategy. This allows the CPU to write directly to a memory address that the PixiJS texture reads from, ensuring high performance (60 FPS) and low latency.

### 1. File Paths

**New Files**
*   `systems/visual_shell/web/cpu_integration.js` (The integration logic)
*   `systems/visual_shell/web/shaders/texture_update.frag` (Optional, for advanced GPU texture streaming, but we will stick to `texture.update()` for simplicity in v8)

**Modified Files**
*   `systems/visual_shell/web/pixel_cpu.js` (Add memory mapping hooks)
*   `systems/visual_shell/web/infinite_map.js` (Add CPU container and render loop hook)

---

### 2. Implementation Code

We will implement a `CpuBridge` class that manages the shared memory buffer and the PixiJS texture.

#### File: `systems/visual_shell/web/cpu_integration.js`

```javascript
import { Texture, RenderTexture, Sprite, Container } from 'pixi.js';

/**
 * MMIO Address Constants
 * Aligns with RISC-V memory map in pixel_cpu.js
 */
const MMIO_FRAMEBUFFER_ADDR = 0x80000000;
const MMIO_FRAMEBUFFER_WIDTH = 320;
const MMIO_FRAMEBUFFER_HEIGHT = 240;

export class CpuBridge {
    constructor(cpu) {
        this.cpu = cpu;
        
        // 1. Create Shared Memory Buffer (RGBA = 4 bytes per pixel)
        this.bufferSize = MMIO_FRAMEBUFFER_WIDTH * MMIO_FRAMEBUFFER_HEIGHT * 4;
        this.frameBuffer = new Uint8ClampedArray(this.bufferSize);
        
        // 2. Map CPU Memory to this Buffer
        // We assume the CPU emulator allows hooking into writes or mapping a DataView
        if (this.cpu.memory) {
            this.cpu.memory.mapRegion(
                MMIO_FRAMEBUFFER_ADDR, 
                this.bufferSize, 
                this.frameBuffer
            );
        }

        // 3. Create PixiJS Texture
        this.renderTexture = RenderTexture.create({
            width: MMIO_FRAMEBUFFER_WIDTH,
            height: MMIO_FRAMEBUFFER_HEIGHT
        });
        
        this.sprite = new Sprite(this.renderTexture);
        this.sprite.scale.set(2); // Scale up for visibility
        
        // Container for CPU visualization
        this.container = new Container();
        this.container.addChild(this.sprite);
        
        this.isDirty = false;
    }

    /**
     * Call this from the InfiniteMap render loop
     */
    sync() {
        // Only update texture if CPU wrote to memory (indicated by a flag or dirty check)
        if (this.isDirty) {
            // Create a view on the buffer for PixiJS
            const imageBitmap = new ImageData(
                this.frameBuffer, 
                MMIO_FRAMEBUFFER_WIDTH, 
                MMIO_FRAMEBUFFER_HEIGHT
            );
            
            // In PixiJS v8, we can update the texture resource directly
            // Note: For maximum performance, this might require a custom Resource class,
            // but ImageData is sufficient for basic integration.
            this.renderTexture.source = imageBitmap; 
            this.renderTexture.update();
            
            this.isDirty = false;
        }
    }

    /**
     * Hook to be called when CPU writes to MMIO region
     */
    markDirty() {
        this.isDirty = true;
    }
}
```

#### Snippet for `systems/visual_shell/web/infinite_map.js`

Add the CPU bridge to the map initialization and render loop.

```javascript
import { CpuBridge } from './cpu_integration.js';

class InfiniteMap {
    constructor(/* ...args */) {
        // ... existing setup ...
        
        // Initialize CPU (assuming global or imported instance)
        const cpu = new PixelCpu(); // Or get global instance
        this.cpuBridge = new CpuBridge(cpu);
        
        // Add CPU Visuals to the map layer
        // This makes the "Screen" float on the infinite map
        this.viewport.addChild(this.cpuBridge.container);
        
        // Position the "Screen" in the world
        this.cpuBridge.container.x = 100;
        this.cpuBridge.container.y = 100;
    }

    // Override or hook into the existing render loop
    render(deltaTime) {
        // ... existing map rendering logic ...
        
        // Sync CPU memory to PixiJS texture
        if (this.cpuBridge) {
            this.cpuBridge.sync();
        }
    }
}
```

#### Snippet for `systems/visual_shell/web/pixel_cpu.js`

Ensure the CPU allows memory mapping or triggers the update.

```javascript
class PixelCpu {
    constructor() {
        this.memory = new Uint8Array(1024 * 1024); // 1MB RAM
        // ... other init
    }

    // Helper to map external buffers to CPU address space
    mapRegion(address, size, targetBuffer) {
        // In a real implementation, you would proxy writes to this region
        // to write to targetBuffer directly.
        // For this example, we assume a simplified write handler:
        this.mmioHandlers = {
            0x80000000: (offset, value) => {
                targetBuffer[offset] = value;
                // Signal the bridge that texture needs update
                if (window.cpuBridge) window.cpuBridge.markDirty(); 
            }
        };
    }
    
    write(address, value) {
        // Check if address is in MMIO range
        if (address >= 0x80000000 && address < 0x80000000 + (320*240*4)) {
            // Handle MMIO write
            // ... logic to write to framebuffer ...
        } else {
            // Standard RAM write
            this.memory[address] = value;
        }
    }
}
```

---

### 3. Next Step

Create the integration file to establish the bridge between the CPU and the GPU.

```bash
touch systems/visual_shell/web/cpu_integration.js
```