# Solution for Task: Update frequency is optimal

Here is the implementation plan for the **Pixel CPU - PixiJS Integration**.

### 1. File Paths

**New Files**
*   `systems/visual_shell/web/cpu_renderer.js`
    *   *Purpose:* A custom PixiJS container/layer that renders the CPU state (registers, flags) and the Framebuffer texture.
*   `systems/visual_shell/web/cpu_bridge.js`
    *   *Purpose:* The interface between the `PixelCPU` emulator and the `InfiniteMap`. It manages memory mapping and the execution loop.

**Modified Files**
*   `systems/visual_shell/web/infinite_map.js`
    *   *Purpose:* Add a method to inject the `CPUBridge` so the map can render CPU-specific layers.
*   `systems/visual_shell/web/pixel_cpu.js`
    *   *Purpose:* Expose the memory buffer (`Uint8Array`) and PC (Program Counter) to the bridge.
*   `systems/visual_shell/web/index.html`
    *   *Purpose:* Include the new script tags.

---

### 2. Code Implementation

#### A. The Bridge (`cpu_bridge.js`)
This file orchestrates the non-blocking execution cycle. It runs a few cycles of the CPU per animation frame and updates the PixiJS texture.

```javascript
// systems/visual_shell/web/cpu_bridge.js
import { PixelCPU } from './pixel_cpu.js';
import { CPURenderer } from './cpu_renderer.js';

export class CPUBridge {
    constructor(app, map) {
        this.app = app;
        this.map = map;
        this.cpu = null;
        this.renderer = null;
        this.isRunning = false;
        
        // Configuration
        this.CYCLES_PER_FRAME = 1000; // Adjust for performance
        this.MEMORY_START = 0x80000000;
        this.FRAMEBUFFER_ADDR = 0x81000000; // Example address
        this.FRAMEBUFFER_WIDTH = 320;
        this.FRAMEBUFFER_HEIGHT = 240;
    }

    async loadBrick(arrayBuffer) {
        // 1. Initialize CPU
        this.cpu = new PixelCPU();
        
        // 2. Load Binary
        const u8 = new Uint8Array(arrayBuffer);
        this.cpu.loadBinary(u8);

        // 3. Setup Memory Mapped I/O (Allocate framebuffer in CPU memory)
        // Assuming pixel_cpu.js has a method to map memory or we write to a specific offset
        this.cpu.memoryMap = new Uint8Array(1024 * 1024 * 8); // 8MB RAM

        // 4. Create Visuals
        this.renderer = new CPURenderer(this.app);
        this.map.addLayer(this.renderer); // Add to infinite map
        
        // Connect CPU memory to Pixi Texture
        this.renderer.attachCPU(this.cpu);
    }

    start() {
        this.isRunning = true;
        this.app.ticker.add(this.update, this);
    }

    stop() {
        this.isRunning = false;
        this.app.ticker.remove(this.update, this);
    }

    update() {
        if (!this.cpu || !this.isRunning) return;

        // Execute N cycles
        const start = performance.now();
        let cycles = 0;
        
        try {
            while (cycles < this.CYCLES_PER_FRAME) {
                this.cpu.step();
                cycles++;
            }
        } catch (e) {
            console.error("CPU Halted:", e);
            this.stop();
        }

        // Update Visuals
        this.renderer.updateRegisters(this.cpu.registers);
        this.renderer.updateFramebuffer();
    }
}
```

#### B. The Renderer (`cpu_renderer.js`)
This handles the high-performance texture updates using PixiJS v8.

```javascript
// systems/visual_shell/web/cpu_renderer.js
import { Container, Graphics, Texture } from 'pixi.js';

export class CPURenderer extends Container {
    constructor(app) {
        super();
        this.app = app;
        
        // Create a Texture for the CPU Framebuffer (320x240)
        this.framebufferTexture = Texture.createEmpty(320, 240);
        this.fbSprite = new Sprite(this.framebufferTexture);
        this.fbSprite.scale.set(2); // Zoom in 2x
        this.addChild(this.fbSprite);

        // Debug UI (Registers)
        this.debugText = new Text({ text: "CPU: STOPPED", style: { fill: 0x00FF00 } });
        this.debugText.y = 250;
        this.addChild(this.debugText);
        
        this.cpuBuffer = null;
    }

    attachCPU(cpu) {
        // Reference the specific region of CPU memory mapped to video
        // This assumes the CPU implementation exposes a raw Uint8Array view
        this.cpuBuffer = new Uint8Array(
            cpu.memoryMap.buffer, 
            cpu.FRAMEBUFFER_ADDR || 0, 
            320 * 240 * 4 // RGBA
        );
    }

    updateRegisters(regs) {
        if(this.debugText) {
            this.debugText.text = `PC: ${regs.pc.toString(16)} | SP: ${regs.sp.toString(16)}`;
        }
    }

    updateFramebuffer() {
        if (!this.cpuBuffer) return;

        // PixiJS v8 Optimization: Update the underlying resource directly
        const resource = this.framebufferTexture.source;
        resource.buffer.set(this.cpuBuffer);
        resource.update();
    }
}
```

#### C. Integration into Infinite Map (`infinite_map.js` - Snippet)

```javascript
// Inside InfiniteMap class
addLayer(layer) {
    this.worldContainer.addChild(layer);
    // Ensure the layer moves with the camera
    // (Implementation depends on specific camera logic in infinite_map.js)
}
```

---

### 3. Next Step

To implement this integration, you first need to create the bridge file that orchestrates the timing between the CPU and the renderer.

**Command:**
```bash
touch systems/visual_shell/web/cpu_bridge.js
```