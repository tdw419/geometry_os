# Solution for Task: Configuration options are documented

Here is the implementation plan for the **Pixel CPU - PixiJS Integration**.

### 1. Implementation Plan

To bridge the gap between the `PixelCPU` and the `InfiniteMap`, we need to introduce a **Controller** layer. This layer will manage the CPU execution loop and bind the CPU's memory regions to PixiJS textures for visualization.

#### Files to be Created

1.  **`systems/visual_shell/web/cpu_renderer.js`** (New)
    *   **Purpose**: Creates a `PIXI.Container` that holds the visual representation of the CPU (Framebuffer texture, Console text overlay, and Register state).
    *   **Functionality**: It will read the CPU's memory mapped I/O regions and update the PixiJS objects every frame.

2.  **`systems/visual_shell/web/cpu_bridge.js`** (New)
    *   **Purpose**: Instantiates the `PixelCPU` and acts as the interface between the UI and the Emulator.
    *   **Functionality**: Handles loading `.brick` files, starting/stopping execution, and exposing memory pointers to the `CpuRenderer`.

#### Files to be Modified

1.  **`systems/visual_shell/web/infinite_map.js`**
    *   **Change**: Add a method `attachCPU(cpuBridge)` to the `InfiniteMap` class. This will add the `CpuRenderer` container to the map scene, allowing the CPU screen to move with the map or exist as a HUD layer.

2.  **`systems/visual_shell/web/pixel_cpu.js`**
    *   **Change**: Ensure the `PixelCPU` class exposes its memory buffer (`this.memory.heap`) directly so the renderer can create a view of it without copying data every frame.

---

### 2. Code Solution

Since the Geometry OS shell is web-based, we will use **JavaScript (ES6+)**.

#### A. New File: `systems/visual_shell/web/cpu_bridge.js`
This class initializes the CPU and handles the execution lifecycle.

```javascript
import { PixelCPU } from './pixel_cpu.js';

export class CPUBridge {
    constructor() {
        // Initialize CPU with 16MB of memory
        this.cpu = new PixelCPU(16 * 1024 * 1024); 
        this.isRunning = false;
        this.fps = 60;
        
        // Memory Mapped I/O Addresses (Arbitrary for this implementation)
        this.MMAP_FRAMEBUFFER = 0x80000000;
        this.MMAP_CONSOLE = 0x90000000;
    }

    async loadBrick(arrayBuffer) {
        // Load binary data into CPU memory
        const data = new Uint8Array(arrayBuffer);
        this.cpu.loadBinary(data);
        console.log(`[CPUBridge] Loaded ${data.length} bytes into memory.`);
    }

    start() {
        if (this.isRunning) return;
        this.isRunning = true;
        this._executeLoop();
    }

    stop() {
        this.isRunning = false;
    }

    _executeLoop() {
        if (!this.isRunning) return;

        // Execute a chunk of instructions (e.g., 1000 cycles per frame)
        // to prevent blocking the main thread.
        const cyclesPerFrame = 1000;
        this.cpu.run(cyclesPerFrame);

        // Schedule next frame
        requestAnimationFrame(() => this._executeLoop());
    }

    // Expose memory for the Renderer to read
    getMemory() {
        return this.cpu.memory.heap;
    }
}
```

#### B. New File: `systems/visual_shell/web/cpu_renderer.js`
This class handles the visualization of CPU memory using PixiJS.

```javascript
import * as PIXI from 'pixi.js';

export class CpuRenderer {
    constructor(cpuBridge) {
        this.bridge = cpuBridge;
        this.container = new PIXI.Container();

        // 1. Setup Framebuffer Texture
        // Assuming 320x240 resolution for the emulated screen
        const width = 320;
        const height = 240;
        
        // Create a texture from the CPU memory region
        // Note: In a real impl, you'd use a Uint32Array view of the heap
        this.framebufferTexture = new PIXI.Texture({
            source: new PIXI.ImageSource(width, height),
        });
        
        const sprite = new PIXI.Sprite(this.framebufferTexture);
        sprite.scale.set(2); // Scale up for visibility
        this.container.addChild(sprite);

        // 2. Setup Console Text Overlay
        this.consoleText = new PIXI.Text({
            text: "CPU Console Ready...",
            style: {
                fontFamily: 'Courier New',
                fontSize: 14,
                fill: 0x00FF00,
                backgroundColor: 0x000000
            }
        });
        this.consoleText.y = height * 2 + 10; // Position below framebuffer
        this.container.addChild(this.consoleText);
    }

    update() {
        // A. Update Framebuffer
        // We create a view into the CPU memory at the specific offset
        const mem = this.bridge.getMemory();
        const fbOffset = this.bridge.MMAP_FRAMEBUFFER;
        
        // In a real implementation, we would update the PIXI texture resource 
        // directly from the Uint32Array view of mem.
        // Pseudo-code for texture update:
        // const fbView = new Uint32Array(mem.buffer, fbOffset, 320 * 240);
        // this.framebufferTexture.source.update(fbView); 

        // B. Update Console Text
        // Read string from memory mapped console region
        const consoleOffset = this.bridge.MMAP_CONSOLE;
        // Simplified: Read first 100 bytes and decode as UTF-8
        const consoleBytes = new Uint8Array(mem.buffer, consoleOffset, 100);
        const nullIndex = consoleBytes.indexOf(0);
        const stringBytes = consoleBytes.slice(0, nullIndex > -1 ? nullIndex : 100);
        
        const currentText = new TextDecoder().decode(stringBytes);
        if (this.consoleText.text !== currentText) {
            this.consoleText.text = currentText;
        }
    }
}
```

#### C. Modification: `systems/visual_shell/web/infinite_map.js`
Integrating the renderer into the existing map.

```javascript
// Inside InfiniteMap class definition

attachCPU(cpuBridge) {
    // Import and instantiate the renderer
    const renderer = new CpuRenderer(cpuBridge);
    
    // Add the CPU visual container to the map (or HUD layer)
    // Assuming this.mapContainer is the main PIXI container for the map
    this.mapContainer.addChild(renderer.container);

    // Hook into the map's update loop
    // (Assuming the map has an event emitter or a hookable update method)
    this.on('update', () => {
        renderer.update();
    });
}
```

---

### 3. Next Step

**Action:** Create the `cpu_bridge.js` file to serve as the integration layer between the `.brick` loader and the emulator.

```bash
touch systems/visual_shell/web/cpu_bridge.js
```