# Solution for Task: Framebuffer writes update pixel data

Here is the implementation plan for integrating the Pixel CPU with the PixiJS Infinite Map to handle framebuffer writes.

### 1. File Paths

**Modified Files**
*   `systems/visual_shell/web/pixel_cpu.js`
    *   *Reason:* To expose the framebuffer memory region and add hooks for memory write interception.
*   `systems/visual_shell/web/infinite_map.js`
    *   *Reason:* To add the `FramebufferTexture` container and update logic.

**New Files**
*   `systems/visual_shell/web/cpu_renderer.js`
    *   *Reason:* To bridge the CPU memory state and the PixiJS rendering context without blocking the main thread.

### 2. Implementation Snippets

#### A. Memory-Mapped I/O Constants (`pixel_cpu.js`)
Define the memory address range where the framebuffer resides.

```javascript
// systems/visual_shell/web/pixel_cpu.js

export const MMIO = {
    FRAMEBUFFER_BASE: 0x80000000, // 2GB mark (typical for high-perf mappings)
    FRAMEBUFFER_WIDTH: 320,
    FRAMEBUFFER_HEIGHT: 240,
    FRAMEBUFFER_SIZE: 320 * 240 * 4 // RGBA
};

export class PixelCPU {
    constructor() {
        // ... existing init ...
        this.framebufferDirty = false;
    }

    // Intercept write operations to the framebuffer region
    writeMemory(address, value) {
        this.memory.set(address, value);
        
        // Check if write is inside framebuffer range
        if (address >= MMIO.FRAMEBUFFER_BASE && 
            address < MMIO.FRAMEBUFFER_BASE + MMIO.FRAMEBUFFER_SIZE) {
            this.framebufferDirty = true;
        }
    }
    
    // Helper to get raw framebuffer bytes for texture upload
    getFramebufferBuffer() {
        // Create a view into the WebAssembly memory (or Uint8Array) 
        // starting at the framebuffer offset
        return this.memory.buffer.slice(
            MMIO.FRAMEBUFFER_BASE, 
            MMIO.FRAMEBUFFER_BASE + MMIO.FRAMEBUFFER_SIZE
        );
    }
}
```

#### B. PixiJS Texture Update (`cpu_renderer.js`)
This component runs inside the requestAnimationFrame loop to push CPU memory to the GPU.

```javascript
// systems/visual_shell/web/cpu_renderer.js
import * as PIXI from 'pixi.js';
import { MMIO } from './pixel_cpu.js';

export class CPURenderer {
    constructor(cpu, mapContainer) {
        this.cpu = cpu;
        
        // Create a texture compatible with Pixel CPU resolution
        this.texture = PIXI.RenderTexture.create({
            width: MMIO.FRAMEBUFFER_WIDTH,
            height: MMIO.FRAMEBUFFER_HEIGHT
        });
        
        this.sprite = new PIXI.Sprite(this.texture);
        this.sprite.x = 100; // Position on the infinite map
        this.sprite.y = 100;
        this.sprite.scale.set(2); // Zoom in for visibility
        
        mapContainer.addChild(this.sprite);
    }

    update() {
        // Only upload to GPU if the CPU wrote to framebuffer memory
        if (this.cpu.framebufferDirty) {
            const buffer = this.cpu.getFramebufferBuffer();
            
            // Create a PIXI Texture from the raw bytes
            const image = new ImageData(
                new Uint8ClampedArray(buffer), 
                MMIO.FRAMEBUFFER_WIDTH, 
                MMIO.FRAMEBUFFER_HEIGHT
            );
            
            // Efficiently update the existing texture
            this.texture.source.updateImage(image);
            
            this.cpu.framebufferDirty = false; // Reset flag
        }
    }
}
```

### 3. Next Step

**Command:** Create the bridge file `systems/visual_shell/web/cpu_renderer.js` with the logic above to enable the CPU to write directly to the PixiJS scene graph.

```bash
touch systems/visual_shell/web/cpu_renderer.js
```