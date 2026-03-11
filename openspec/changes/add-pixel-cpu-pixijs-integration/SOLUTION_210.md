# Solution for Task: Background is styled correctly

Here is the implementation plan for **Phase 40: Add Pixel CPU - PixiJS Integration**.

Based on the context provided, we are bridging the gap between the RISC-V emulator and the PixiJS visual engine. The solution involves creating a bridge to manage asynchronous execution and a specialized texture update handler for the framebuffer.

### 1. File Paths

**New Files to Create:**
*   `systems/visual_shell/web/cpu_bridge.js`
    *   *Responsibility*: Manages the lifecycle of the `PixelCPU`, handles the loading of `.brick` files, and runs the execution loop in a non-blocking manner using `requestAnimationFrame` or `setTimeout`.
*   `systems/visual_shell/web/pixi_framebuffer.js`
    *   *Responsibility*: Wraps a PixiJS `Texture` and `Sprite`. It reads the specific memory range from the CPU's RAM (the framebuffer) and updates the GPU texture without creating garbage (object churn).

**Files to Modify:**
*   `systems/visual_shell/web/infinite_map.js`
    *   *Change*: Import `CpuBridge` and `PixiFramebuffer`. Instantiate the CPU and register the framebuffer as a dynamic layer on the map.
*   `systems/visual_shell/web/pixel_cpu.js`
    *   *Change*: Ensure the `memory` array is exposed or accessible so the bridge can read the framebuffer bytes.

---

### 2. Implementation Code

Here is the JavaScript implementation required.

#### A. The CPU Bridge (`cpu_bridge.js`)
This file connects the emulator to the visual system. It executes instructions in chunks to maintain 60 FPS.

```javascript
// systems/visual_shell/web/cpu_bridge.js
import { PixelCPU } from './pixel_cpu.js';

export class CpuBridge {
    constructor(memorySize = 65536) {
        // Initialize CPU with specific memory size
        this.cpu = new PixelCPU(memorySize);
        this.isRunning = false;
        this.onFrameUpdate = null; // Callback for visual updates
    }

    /**
     * Loads a binary .brick file into CPU memory
     */
    async loadBrick(arrayBuffer) {
        const data = new Uint8Array(arrayBuffer);
        // Load into memory starting at address 0 (or specific offset)
        for (let i = 0; i < data.length; i++) {
            this.cpu.memory[i] = data[i];
        }
        console.log(`[CpuBridge] Loaded ${data.length} bytes into memory.`);
    }

    /**
     * Starts the execution loop
     */
    start() {
        if (this.isRunning) return;
        this.isRunning = true;
        this._loop();
    }

    stop() {
        this.isRunning = false;
    }

    /**
     * Non-blocking execution loop
     * Runs a batch of instructions per frame, then yields to the browser
     */
    _loop() {
        if (!this.isRunning) return;

        const startTime = performance.now();
        const budget = 16; // Aim for ~16ms per frame (60 FPS)

        // Execute instructions until we run out of time budget
        while (performance.now() - startTime < budget) {
            // Execute one instruction
            // Returns false if CPU halts
            if (!this.cpu.step()) {
                this.isRunning = false;
                console.log("[CpuBridge] CPU Halted.");
                break;
            }
        }

        // Trigger visual update (e.g., redraw framebuffer)
        if (this.onFrameUpdate) {
            this.onFrameUpdate(this.cpu);
        }

        // Schedule next frame
        if (this.isRunning) {
            requestAnimationFrame(() => this._loop());
        }
    }
}
```

#### B. The PixiJS Framebuffer (`pixi_framebuffer.js`)
This maps CPU memory to a visual texture.

```javascript
// systems/visual_shell/web/pixi_framebuffer.js
import { Texture, Sprite } from 'pixi.js';

export class PixiFramebuffer {
    constructor(cpu, baseAddress, width, height) {
        this.cpu = cpu;
        this.baseAddr = baseAddress;
        this.width = width;
        this.height = height;

        // Create a buffer for pixel data (RGBA = 4 bytes per pixel)
        this.pixelBuffer = new Uint8ClampedArray(width * height * 4);

        // Create PixiJS Texture from this buffer
        this.texture = Texture.fromBuffer(this.pixelBuffer, width, height);
        this.sprite = new Sprite(this.texture);
    }

    /**
     * Call this every frame to sync CPU memory to GPU Texture
     */
    update() {
        // 1. Read CPU Memory into Pixel Buffer
        // Assuming 1 byte per pixel (grayscale) for simplicity, 
        // or mapping memory bytes to RGB values.
        
        const mem = this.cpu.memory;
        const len = this.width * this.height;

        for (let i = 0; i < len; i++) {
            const memVal = mem[this.baseAddr + i];
            
            // Map memory value to color (Example: Simple Grayscale)
            const offset = i * 4;
            this.pixelBuffer[offset] = memVal;     // R
            this.pixelBuffer[offset + 1] = memVal; // G
            this.pixelBuffer[offset + 2] = memVal; // B
            this.pixelBuffer[offset + 3] = 255;    // Alpha
        }

        // 2. Update the Texture
        // In PixiJS v8, we update the resource
        this.texture.source.update();
    }
}
```

---

### 3. Next Step

**Command:** Create the CPU Bridge file to establish the non-blocking execution logic.

```bash
touch systems/visual_shell/web/cpu_bridge.js
```