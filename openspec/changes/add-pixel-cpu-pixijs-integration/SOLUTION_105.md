# Solution for Task: Framebuffer texture is created

Here is the implementation plan for **Phase 40: Framebuffer Texture Creation**.

This phase focuses on the visual output pipeline. We need to create a dynamic texture that acts as the bridge between the Pixel CPU's memory (the framebuffer) and the PixiJS rendering engine.

### 1. File Paths

*   **Create:** `systems/visual_shell/web/cpu_visualizer.js` (New component to handle CPU-to-Visual translation)
*   **Modify:** `systems/visual_shell/web/infinite_map.js` (To instantiate and attach the visualizer)

### 2. Implementation Code

We will create the `CpuVisualizer` class. This class manages a `PIXI.Texture` that is updated whenever the CPU writes to its memory-mapped framebuffer region.

**File: `systems/visual_shell/web/cpu_visualizer.js`**

```javascript
import { Texture, Sprite, Container } from 'pixi.js';

/**
 * CpuVisualizer
 * 
 * Bridges the Pixel CPU memory state with the PixiJS rendering system.
 * Creates a dynamic texture representing the CPU's framebuffer (Memory Mapped I/O).
 */
export class CpuVisualizer {
    constructor(cpu, framebufferBaseAddress = 0x80000000) {
        this.cpu = cpu;
        this.fbAddress = framebufferBaseAddress;
        
        // Framebuffer Configuration (e.g., 64x32 resolution)
        this.width = 64;
        this.height = 32;
        this.pixelCount = this.width * this.height;

        // Create a buffer to hold pixel data (RGBA format)
        this.pixelBuffer = new Uint32Array(this.pixelCount);

        // Create a PixiJS Texture from this buffer
        // We use BufferResource to allow manual updates
        const bufferResource = new PIXI.BufferResource(this.pixelBuffer.buffer, {
            width: this.width,
            height: this.height,
        });
        
        this.texture = new Texture(bufferResource);
        
        // Create a Sprite to render this texture in the world
        this.sprite = new Sprite(this.texture);
        this.sprite.scale.set(10); // Scale up 10x so pixels are visible
        this.sprite.anchor.set(0.5);
    }

    /**
     * Updates the PixiJS texture based on current CPU memory state.
     * This should be called inside the PixiJS ticker or render loop.
     */
    updateTexture() {
        const memory = this.cpu.memory;
        let dirty = false;

        // Scan CPU memory for the framebuffer region
        // Optimization: In a real system, we would use a 'Dirty Flag' or page fault
        for (let i = 0; i < this.pixelCount; i++) {
            // Assuming 32-bit color (0xAABBGGRR) stored in CPU RAM
            // We read the 32-bit word at the mapped address
            const memOffset = (this.fbAddress + (i * 4)) >>> 2; // Convert byte addr to word index
            
            // Safety check for memory bounds
            if (memOffset >= memory.length) break;

            const color = memory[memOffset];

            // If pixel is different from buffer, update it
            if (this.pixelBuffer[i] !== color) {
                this.pixelBuffer[i] = color;
                dirty = true;
            }
        }

        if (dirty) {
            // Update the underlying GPU resource
            this.texture.source.resource.update();
        }
    }

    /**
     * Attach the visualizer sprite to a PixiJS container (e.g., InfiniteMap)
     */
    attachTo(container) {
        container.addChild(this.sprite);
    }
}
```

### 3. Integration Logic

To activate this, you need to hook the `updateTexture` method into the render loop of `infinite_map.js`.

**Snippet to add to `systems/visual_shell/web/infinite_map.js`:**

```javascript
// Inside InfiniteMap class constructor
if (this.cpu) {
    this.cpuVisualizer = new CpuVisualizer(this.cpu);
    this.cpuVisualizer.attachTo(this.viewport); // Or specific tile container
}

// Inside InfiniteMap.update() or the Ticker loop
if (this.cpuVisualizer) {
    this.cpuVisualizer.updateTexture();
}
```

### 3. Next Step

**Run the following command to scaffold the new visualizer file:**

```bash
touch systems/visual_shell/web/cpu_visualizer.js
```