# Solution for Task: Carriage returns are handled

Here is the implementation plan for integrating the Pixel CPU with the PixiJS Infinite Map.

### 1. File Paths

The following files will be created or modified to bridge the `pixel_cpu.js` and `infinite_map.js` components.

**New Files**
*   `systems/visual_shell/web/cpu_bridge.js` (New)
    *   *Role*: Manages the execution lifecycle, creates the Web Worker for the CPU, and handles the message passing between the Worker (CPU) and the Main Thread (PixiJS).
*   `systems/visual_shell/web/cpu_renderer.js` (New)
    *   *Role*: A PixiJS `Container` subclass that listens to CPU state updates and renders the framebuffer/text to the map.

**Modified Files**
*   `systems/visual_shell/web/pixel_cpu.js`
    *   *Change*: Wrap the CPU logic in a `self.onmessage` block to function as a Web Worker.
*   `systems/visual_shell/web/infinite_map.js`
    *   *Change*: Import and instantiate `CpuRenderer` to add the CPU visualization layer to the map.

---

### 2. Implementation Code

#### A. The CPU Worker Wrapper (`systems/visual_shell/web/pixel_cpu.js`)
We need to expose the existing CPU logic to the main thread via the Web Worker API.

```javascript
// pixel_cpu.js
// Assuming the existing CPU class is available in this scope as 'PixelCPU'

self.onmessage = function(e) {
    const { type, payload } = e.data;

    if (type === 'INIT') {
        // Initialize CPU with binary payload
        try {
            self.cpu = new PixelCPU(payload.memorySize);
            self.cpu.loadBinary(payload.data);
            
            // Start the execution loop
            self.running = true;
            runLoop();
        } catch (err) {
            self.postMessage({ type: 'ERROR', payload: err.message });
        }
    } else if (type === 'STOP') {
        self.running = false;
    }
};

function runLoop() {
    if (!self.running) return;

    // Execute a batch of instructions (e.g., 1000 cycles per frame)
    // to prevent blocking the worker entirely.
    const cyclesPerFrame = 1000;
    const state = self.cpu.step(cyclesPerFrame);

    // Send relevant state updates back to the main thread
    // We transfer the framebuffer buffer directly for performance (Zero-copy)
    self.postMessage({
        type: 'TICK',
        payload: {
            pc: self.cpu.registers.PC,
            framebuffer: self.cpu.memory.framebuffer, // Uint8Array
            consoleOutput: self.cpu.memory.consoleOutput
        }
    }, [state.framebuffer.buffer]); // Transferable object

    // Schedule next tick via setTimeout or just loop (worker is non-blocking to UI)
    // Using requestAnimationFrame equivalent in worker is complex, 
    // so we rely on the browser's scheduling.
    setTimeout(runLoop, 0); 
}
```

#### B. The Bridge Logic (`systems/visual_shell/web/cpu_bridge.js`)
This file orchestrates the worker and the renderer.

```javascript
// cpu_bridge.js
import * as PIXI from 'pixi.js';
import { CpuRenderer } from './cpu_renderer.js';

export class CpuBridge {
    constructor(app) {
        this.app = app;
        this.worker = null;
        this.renderer = null;
    }

    async loadBrick(url) {
        // 1. Fetch the .brick file
        const response = await fetch(url);
        const buffer = await response.arrayBuffer();

        // 2. Initialize Worker
        // Note: In a real bundler, you might import the worker directly.
        // Here we assume a standard worker file setup.
        this.worker = new Worker('./pixel_cpu.js', { type: 'module' });

        // 3. Initialize Renderer
        this.renderer = new CpuRenderer();
        this.app.stage.addChild(this.renderer);

        // 4. Handle Worker Messages
        this.worker.onmessage = (e) => {
            const { type, payload } = e.data;
            if (type === 'TICK') {
                this.renderer.update(payload);
            }
        };

        // 5. Boot CPU
        this.worker.postMessage({
            type: 'INIT',
            payload: {
                data: new Uint8Array(buffer),
                memorySize: 64 * 1024 // 64KB
            }
        });
    }

    destroy() {
        if (this.worker) this.worker.terminate();
        if (this.renderer) this.app.stage.removeChild(this.renderer);
    }
}
```

#### C. The Visual Renderer (`systems/visual_shell/web/cpu_renderer.js`)
This creates the texture from the CPU memory.

```javascript
// cpu_renderer.js
import * as PIXI from 'pixi.js';

export class CpuRenderer extends PIXI.Container {
    constructor() {
        super();
        
        // Create a texture for the framebuffer (e.g., 320x240 resolution)
        this.resolution = { width: 320, height: 240 };
        
        // Create a Sprite to display the CPU memory
        this.texture = PIXI.Texture.createEmpty();
        this.sprite = new PIXI.Sprite(this.texture);
        
        // Scale it up to be visible on the map
        this.sprite.scale.set(2); 
        this.sprite.x = 100; // Position on the map
        this.sprite.y = 100;
        
        this.addChild(this.sprite);
        
        // Create a texture update resource
        this.updateResource = new PIXI.utils.TextureResource(new Uint8Array(this.resolution.width * this.resolution.height * 4));
    }

    update(state) {
        // Update the texture with new framebuffer data
        // Assuming state.framebuffer is a Uint8Array (RGBA)
        this.updateResource.data = state.framebuffer;
        
        // Force texture update
        const texture = PIXI.Texture.from(this.updateResource);
        this.sprite.texture = texture;
        
        // Optional: Update PC label or debug info here
    }
}
```

---

### 3. Next Step

**Command:**
Create the file `systems/visual_shell/web/cpu_bridge.js` with the content provided in Section 2B. This will serve as the entry point for integrating the CPU worker into the application.