# Solution for Task: CPU executes cyclesPerFrame per call

Here is the implementation plan for the **Pixel CPU - PixiJS Integration**, focusing on the `cyclesPerFrame` execution logic within the render loop.

### 1. File Paths

**New File**
*   `systems/visual_shell/web/cpu_bridge.js`
    *   **Purpose**: Acts as the interface between the visual shell and the Pixel CPU emulator. Handles the scheduling of CPU cycles per frame.

**Modified Files**
*   `systems/visual_shell/web/infinite_map.js`
    *   **Purpose**: Initialize the CPU Bridge and register it to the PixiJS `ticker` (render loop).
*   `systems/visual_shell/web/pixel_cpu.js`
    *   **Purpose**: Ensure the `RISCVCPU` class exposes a `step(n)` method to execute exactly `n` cycles.

---

### 2. Implementation Code

#### A. Create `systems/visual_shell/web/cpu_bridge.js`
This class wraps the CPU emulator. It implements the `tick(deltaTime)` method required by the PixiJS Ticker to execute a specific number of cycles based on the desired speed.

```javascript
// systems/visual_shell/web/cpu_bridge.js
import { RISCVCPU } from './pixel_cpu.js';

export class CPUBridge {
    /**
     * @param {number} cyclesPerFrame - Target instructions to execute per frame (approx 16ms).
     */
    constructor(cyclesPerFrame = 1000) {
        this.cpu = new RISCVCPU();
        this.cyclesPerFrame = cyclesPerFrame;
        this.isRunning = false;
        
        // Memory Mapped I/O placeholders (to be linked to PixiJS textures later)
        this.frameBuffer = new Uint8Array(320 * 240 * 4); // RGBA buffer
    }

    /**
     * Loads a .brick binary into CPU memory.
     * @param {ArrayBuffer} binaryBuffer 
     */
    loadBinary(binaryBuffer) {
        const data = new Uint8Array(binaryBuffer);
        // Load into memory starting at 0x0 (or appropriate offset)
        this.cpu.memory.set(data, 0);
        this.cpu.reset();
        console.log(`[CPUBridge] Loaded ${data.length} bytes into memory.`);
    }

    /**
     * Called by PixiJS Ticker every frame.
     * Executes exactly this.cyclesPerFrame instructions.
     */
    tick() {
        if (!this.isRunning) return;

        try {
            // Execute the configured number of cycles
            // Assumption: pixel_cpu.js has a step(cycles) method
            this.cpu.step(this.cyclesPerFrame);
            
            // TODO: Check for Memory Mapped I/O updates here
            // this._syncFrameBuffer();

        } catch (e) {
            console.error("CPU Execution Error:", e);
            this.isRunning = false;
        }
    }

    start() {
        this.isRunning = true;
    }

    stop() {
        this.isRunning = false;
    }
}
```

#### B. Modify `systems/visual_shell/web/infinite_map.js`
We need to instantiate the `CPUBridge` and add it to the PixiJS application's ticker.

```javascript
// systems/visual_shell/web/infinite_map.js
import { CPUBridge } from './cpu_bridge.js';

export class InfiniteMap {
    constructor(app) {
        this.app = app;
        this.container = new PIXI.Container();
        this.app.stage.addChild(this.container);

        // Initialize CPU Bridge
        // Target 10,000 cycles per frame for "Fast" execution, or 1000 for "Slow"
        this.cpuBridge = new CPUBridge(10000); 

        // Register the CPU execution loop with the PixiJS Ticker
        // This ensures tick() is called every frame (approx 60fps)
        this.app.ticker.add((delta) => {
            this.cpuBridge.tick();
        });

        this.initMap();
    }

    // Example method to load a brick file from a drag-and-drop event
    async loadBrickFile(arrayBuffer) {
        this.cpuBridge.loadBinary(arrayBuffer);
        this.cpuBridge.start();
    }

    initMap() {
        // ... existing map initialization code ...
    }
}
```

#### C. Verify `systems/visual_shell/web/pixel_cpu.js`
Ensure your CPU class has the batch execution method.

```javascript
// systems/visual_shell/web/pixel_cpu.js
export class RISCVCPU {
    // ... existing constructor and memory setup ...

    /**
     * Executes N instructions.
     * @param {number} cycles - Number of cycles to run
     */
    step(cycles) {
        let cyclesRun = 0;
        while (cyclesRun < cycles && !this.halted) {
            // Fetch, Decode, Execute logic here
            this.executeOneInstruction();
            cyclesRun++;
        }
    }

    executeOneInstruction() {
        // ... existing logic ...
    }
}
```

---

### 3. Next Step

**Command:** Create the `cpu_bridge.js` file to enable the execution loop.

```bash
touch systems/visual_shell/web/cpu_bridge.js
```