# Solution for Task: Formatting is consistent

Here is the implementation plan for integrating the Pixel CPU with the PixiJS Infinite Map within the Geometry OS Visual Shell.

### 1. File Paths

**New File**
*   `systems/visual_shell/web/cpu_renderer.js`
    *   *Responsibility*: Bridges the CPU emulator and PixiJS. Manages the `PIXI.Container` for the CPU display, creates the `PIXI.Texture` from the CPU's framebuffer memory, and handles the render loop updates.

**Modified Files**
*   `systems/visual_shell/web/pixel_cpu.js`
    *   *Change*: Expose the framebuffer memory array and `halted` state to the renderer.
*   `systems/visual_shell/web/infinite_map.js`
    *   *Change*: Import and instantiate `CpuRenderer`. Add the CPU container to the map scene so it moves with the viewport or stays anchored as a UI element.
*   `systems/visual_shell/web/main.js`
    *   *Change*: Initialize the CPU emulator and pass the `.brick` file binary data to it upon loading.

---

### 2. Implementation Code

Since this is a browser-based visualization system, the integration requires **JavaScript** to bind the CPU state to the PixiJS scene graph.

#### A. Create `systems/visual_shell/web/cpu_renderer.js`

This class creates a PixiJS Texture that directly maps to the Pixel CPU's memory.

```javascript
import * as PIXI from 'pixi.js';

export class CpuRenderer {
    constructor(cpu, width = 64, height = 64) {
        this.cpu = cpu;
        this.width = width;
        this.height = height;
        
        // Container to hold the CPU visuals
        this.container = new PIXI.Container();
        
        // Create a BaseTexture for the framebuffer
        // We use a BufferResource to avoid creating a Canvas element
        this.bufferResource = new PIXI.BufferResource(new Uint8Array(width * height * 4), {
            width: width,
            height: height,
            format: PIXI.FORMATS.RGBA
        });
        
        this.texture = new PIXI.Texture(this.bufferResource);
        
        // Create a Sprite to display the texture
        this.sprite = new PIXI.Sprite(this.texture);
        this.sprite.scale.set(4); // Scale up for visibility (pixel art style)
        this.container.addChild(this.sprite);

        // Label for the CPU
        const label = new PIXI.Text("PIXEL CPU", {
            fontFamily: 'Monospace',
            fontSize: 12,
            fill: 0x00FF00
        });
        label.y = height * 4 + 10;
        this.container.addChild(label);
    }

    update() {
        // 1. Check if CPU has written to memory (FrameBuffer region)
        // Assuming FrameBuffer is mapped at 0x8000_0000 for this example
        const fbOffset = 0x1000; // Example offset in RAM array
        const memView = new Uint8Array(this.cpu.memory.buffer, fbOffset, this.width * this.height * 4);

        // 2. Update the PixiJS Texture directly from CPU memory
        // This is efficient; it uploads the memory to GPU without copy overhead if possible
        const textureBuffer = this.bufferResource.data;
        
        // Simple render: If CPU changed memory, update texture
        // In a real scenario, you might use a dirty flag or SharedArrayBuffer
        textureBuffer.set(memView);

        // 3. Flag texture for upload
        this.texture.update();

        // 4. Execute next instruction(s)
        if (!this.cpu.halted) {
            this.cpu.step(); 
        }
    }
}
```

#### B. Modify `systems/visual_shell/web/infinite_map.js`

Add the CPU visual to the map layer.

```javascript
import { CpuRenderer } from './cpu_renderer.js';

class InfiniteMap {
    constructor(app) {
        this.app = app;
        this.viewport = ...; // Existing viewport setup
        
        // Initialize CPU Renderer
        // Assuming 'cpu' is passed in or instantiated here
        this.cpuRenderer = new CpuRenderer(this.cpu); 
        
        // Add CPU visual to the scene
        // We add it to the 'scaled' container so it zooms with the map
        this.viewport.addChild(this.cpuRenderer.container);
        
        // Position the CPU "Screen" on the map
        this.cpuRenderer.container.position.set(100, 100);
    }

    // Existing update loop
    onFrameUpdate() {
        // ... existing map logic ...

        // Update CPU State and Texture
        this.cpuRenderer.update();
    }
}
```

---

### 3. Next Step

**Run the following command to create the new renderer component file:**

```bash
touch systems/visual_shell/web/cpu_renderer.js
```

Then, paste the **CpuRenderer** code provided above into that file. Afterward, modify `infinite_map.js` to import and initialize this class to complete the visual integration.