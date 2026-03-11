# Solution for Task: Texture updates on each frame

Here is the implementation plan for the **Texture updates on each frame** task within the Geometry OS Pixel CPU - PixiJS integration.

This implementation focuses on creating a specialized `PIXI.Container` subclass that acts as a bridge between the CPU's memory and the PixiJS rendering engine.

### 1. File Paths

*   **Create**: `systems/visual_shell/web/components/FramebufferDisplay.js`
*   **Modify**: `systems/visual_shell/web/infinite_map.js` (To instantiate the FramebufferDisplay)
*   **Modify**: `systems/visual_shell/web/pixel_cpu.js` (To expose the memory buffer if not already accessible)

### 2. Implementation Code

**File:** `systems/visual_shell/web/components/FramebufferDisplay.js`

This class creates a 640x480 texture. Inside the `render` method (which runs every frame before the GPU upload), it reads the specified memory array from the Pixel CPU and updates the texture data.

```javascript
import { Container, RenderTexture, BitmapText, Sprite } from 'pixi.js';

/**
 * FramebufferDisplay
 * 
 * Connects a Pixel CPU memory region to a PixiJS Texture.
 * 
 * Architecture:
 * 1. Uses a RenderTexture as the display target.
 * 2. In the render() loop (called every frame by PixiJS), it reads 
 *    the Uint8Array from the Pixel CPU.
 * 3. Updates the texture resource directly.
 */
export class FramebufferDisplay extends Container {
    /**
     * @param {Object} pixelCpu - The instance of the PixelCPU emulator.
     * @param {number} address - The memory-mapped I/O address of the framebuffer.
     * @param {number} width - Framebuffer width (default 640).
     * @param {number} height - Framebuffer height (default 480).
     */
    constructor(pixelCpu, address, width = 640, height = 480) {
        super();

        this.pixelCpu = pixelCpu;
        this.address = address;
        this.width = width;
        this.height = height;
        
        // Calculate total size (assuming 4 bytes per pixel: RGBA)
        this.bufferSize = width * height * 4;

        // Initialize the texture
        this.texture = RenderTexture.create({ width, height });
        this.sprite = new Sprite(this.texture);
        this.addChild(this.sprite);

        // Optional: Add a visual border or label
        this._createDebugOverlay();
    }

    _createDebugOverlay() {
        // Using a simple text object to label the CPU output
        // (Assumes a font is loaded, otherwise omit for strict MVP)
        // const style = { fill: 0x00FF00 };
        // this.debugText = new Text('CPU: OFFLINE', style);
        // this.debugText.y = -20;
        // this.addChild(this.debugText);
    }

    /**
     * The render loop hook.
     * This method is called automatically by PixiJS every frame.
     * We override it to inject our CPU-to-GPU data transfer.
     */
    render(renderer) {
        // 1. Safety Check: Ensure CPU is initialized
        if (!this.pixelCpu || !this.pixelCpu.memory) {
            // if (this.debugText) this.debugText.text = 'CPU: OFFLINE';
            return;
        }

        // 2. Memory Access: Get the view of the framebuffer memory
        // We assume the Pixel CPU memory is a Uint8Array or similar buffer
        const mem = this.pixelCpu.memory;
        
        // Ensure we don't read out of bounds
        if (mem.length < this.address + this.bufferSize) {
            return;
        }

        // 3. Data Transfer: Create a view on the specific memory region
        // We slice the main memory to get just the framebuffer data
        const framebufferData = mem.subarray(this.address, this.address + this.bufferSize);

        // 4. Texture Update: Push data to GPU
        // We use 'this.texture.source.upload' or modify the resource directly.
        // In PixiJS v8, we can update the resource.
        
        // Note: For maximum performance with 60FPS, we might use a specific BufferResource,
        // but updating the RenderTexture directly is the most straightforward integration.
        const resource = this.texture.source;
        
        // Check if resource is valid (Pixi v8 specific handling)
        if (resource && resource.resource) {
             // Upload the Uint8Array directly to the GPU texture
             resource.resource.upload(framebufferData);
        }

        // if (this.debugText) this.debugText.text = 'CPU: ONLINE';

        // 5. Standard Render: Continue with normal container rendering
        super.render(renderer);
    }

    /**
     * Cleanup when the object is destroyed
     */
    destroy(options) {
        this.texture.destroy(true);
        super.destroy(options);
    }
}
```

### 3. Next Step

**Command:** Create the component file and integrate it into the InfiniteMap.

Run the following command to create the file structure:

```bash
mkdir -p systems/visual_shell/web/components
touch systems/visual_shell/web/components/FramebufferDisplay.js
```

Then, paste the JavaScript code provided above into `FramebufferDisplay.js`. Finally, open `infinite_map.js` and import this class to add a live CPU view to your map scene.