# Solution for Task: Newlines work correctly

Here is the implementation plan for integrating the Pixel CPU with the PixiJS Infinite Map.

### 1. File Paths

*   **Modified:** `systems/visual_shell/web/infinite_map.js`
    *   To integrate the CPU instance and manage the update loop.
*   **Modified:** `systems/visual_shell/web/pixel_cpu.js`
    *   To expose memory-mapped I/O regions (MMIO) for the framebuffer.
*   **Created:** `systems/visual_shell/web/cpu_renderer.js`
    *   A new utility to convert raw memory bytes into PixiJS Textures.

### 2. Implementation Code

We will implement the **Memory Mapped I/O (MMIO)** bridge. This allows the CPU to write pixel data to a specific memory address, which the PixiJS map then reads to update the visual texture.

**Step 1: Extend `pixel_cpu.js` for MMIO**
We need to expose the memory buffer directly so the GPU can read it without expensive copying.

```javascript
/* systems/visual_shell/web/pixel_cpu.js */

class PixelCPU {
    constructor(memorySize = 1024 * 1024) {
        this.memory = new Uint8Array(memorySize);
        this.registers = new Uint32Array(32);
        this.pc = 0;
        
        // Define MMIO Address Space
        // 0x1000 - 0x2000: Framebuffer (64x32 monochrome display)
        this.MMIO_FRAMEBUFFER_START = 0x1000;
        this.MMIO_FRAMEBUFFER_END = 0x2000; 
    }

    // ... existing execution logic ...

    /**
     * Returns a direct reference to the framebuffer memory region.
     * This avoids copying data and allows PixiJS to read directly from CPU memory.
     */
    getFramebufferBuffer() {
        return this.memory.subarray(
            this.MMIO_FRAMEBUFFER_START, 
            this.MMIO_FRAMEBUFFER_END
        );
    }
}
```

**Step 2: Create `cpu_renderer.js`**
This handles the conversion of raw CPU memory into a viewable PixiJS texture.

```javascript
/* systems/visual_shell/web/cpu_renderer.js */

export class CPURenderer {
    constructor(cpu) {
        this.cpu = cpu;
        // Create a texture large enough for the memory-mapped display
        // Assuming a 64x32 pixel display mapped linearly
        this.width = 64;
        this.height = 32;
        
        // Create a Canvas to manipulate pixel data manually
        this.canvas = document.createElement('canvas');
        this.canvas.width = this.width;
        this.canvas.height = this.height;
        this.ctx = this.canvas.getContext('2d');
        
        // Create ImageData for fast pixel manipulation
        this.imageData = this.ctx.createImageData(this.width, this.height);
        
        // Create the Pixi Texture from the canvas
        this.texture = PIXI.Texture.from(this.canvas);
    }

    /**
     * Syncs CPU memory to the PixiJS Texture.
     * Call this once per frame.
     */
    update() {
        const fbBuffer = this.cpu.getFramebufferBuffer();
        const data = this.imageData.data;

        // Map CPU memory bytes to Canvas RGBA pixels
        // If CPU memory is 1-bit per pixel, this logic expands it to 8-bit RGBA
        for (let i = 0; i < fbBuffer.length; i++) {
            const byte = fbBuffer[i];
            
            // Iterate through bits of the byte (8 pixels per byte)
            for (let bit = 0; bit < 8; bit++) {
                const pixelIndex = (i * 8) + bit;
                const isOn = (byte >> bit) & 1;

                // Calculate position in ImageData array (4 bytes per pixel: R, G, B, A)
                const idx = pixelIndex * 4;
                
                // Set pixel color (e.g., Green for Matrix style)
                data[idx] = 0;     // R
                data[idx + 1] = isOn ? 255 : 0; // G
                data[idx + 2] = 0; // B
                data[idx + 3] = 255; // Alpha
            }
        }

        this.ctx.putImageData(this.imageData, 0, 0);
        
        // Update the Pixi texture to reflect the canvas changes
        this.texture.update();
    }
}
```

**Step 3: Integrate into `infinite_map.js`**
Update the infinite map to instantiate the CPU and render the texture.

```javascript
/* systems/visual_shell/web/infinite_map.js */

import { PixelCPU } from './pixel_cpu.js';
import { CPURenderer } from './cpu_renderer.js';

export class InfiniteMap {
    constructor() {
        // ... existing PixiJS setup ...
        
        // 1. Initialize CPU
        this.cpu = new PixelCPU();
        
        // 2. Initialize Renderer
        this.cpuRenderer = new CPURenderer(this.cpu);
        
        // 3. Create a Sprite to display the CPU output on the map
        this.cpuSprite = new PIXI.Sprite(this.cpuRenderer.texture);
        this.cpuSprite.x = 100;
        this.cpuSprite.y = 100;
        this.cpuSprite.scale.set(4); // Scale up so we can see pixels
        this.container.addChild(this.cpuSprite);

        // Hook into the existing ticker
        this.app.ticker.add((delta) => this.gameLoop(delta));
    }

    gameLoop(delta) {
        // Execute a chunk of CPU instructions (non-blocking)
        this.cpu.executeSteps(100); // Execute 100 instructions per frame

        // Update the visual texture based on new CPU memory state
        this.cpuRenderer.update();
    }
}
```

### 3. Next Step

Run the following command to create the new renderer module and verify the integration points:

```bash
touch systems/visual_shell/web/cpu_renderer.js
```