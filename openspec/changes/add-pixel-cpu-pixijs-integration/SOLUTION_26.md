# Solution for Task: CPU instance is initialized

Here is the implementation plan for the **Pixel CPU - PixiJS Integration**, focusing on initializing the CPU instance and bridging it with the visual environment.

### 1. File Paths

**New File**
*   `systems/visual_shell/web/cpu_manager.js`
    *   *Purpose*: Encapsulates the CPU execution logic, memory management, and the interface between the Pixel CPU and the PixiJS Infinite Map.

**Modified Files**
*   `systems/visual_shell/web/infinite_map.js`
    *   *Change*: Import and instantiate `CpuManager`. Add logic to render CPU state (register values, flags) to the debug overlay or map tiles.
*   `systems/visual_shell/web/main.js` (or entry point)
    *   *Change*: Initialize the CPU manager and pass the PixiJS Application instance to it.

### 2. Implementation Code

We will create a `CpuManager` class that wraps the `PixelCPU`. This class handles the "Instruction Fetch, Decode, Execute" cycle without blocking the main thread.

**File: `systems/visual_shell/web/cpu_manager.js`**

```javascript
import { PixelCPU } from './pixel_cpu.js'; // Assuming class export in pixel_cpu.js

/**
 * Manages the CPU lifecycle, execution state, and IO bridging 
 * between the PixelCPU and the PixiJS Visual Shell.
 */
export class CpuManager {
    constructor(app) {
        this.app = app;
        this.cpu = null;
        this.isRunning = false;
        this.executionSpeed = 1000; // Instructions per frame target
        this.memorySize = 1024 * 64; // 64KB system memory
    }

    /**
     * Initializes the CPU instance with memory and IO handlers.
     * @param {Uint8Array} initialBinary - Optional .brick binary data to load.
     */
    initialize(initialBinary = null) {
        console.log("[CpuManager] Initializing CPU...");

        // 1. Instantiate the Pixel CPU
        this.cpu = new PixelCPU({
            memorySize: this.memorySize,
            onHalt: () => this.handleHalt(),
            onOutput: (char) => this.handleConsoleOutput(char)
        });

        // 2. Load Binary if provided
        if (initialBinary) {
            this.loadBinary(initialBinary);
        }

        // 3. Setup Visual hooks
        this.setupDebugDisplay();
    }

    /**
     * Loads a .brick binary into CPU memory.
     */
    loadBinary(binaryData) {
        if (!this.cpu) return;
        // Load into memory address 0x0 (or specific offset)
        this.cpu.memory.set(binaryData, 0);
        console.log(`[CpuManager] Loaded ${binaryData.length} bytes into memory.`);
    }

    /**
     * Executes a batch of instructions. 
     * Designed to be called once per frame (non-blocking).
     */
    stepFrame() {
        if (!this.cpu || !this.isRunning) return;

        const start = performance.now();
        
        // Execute a chunk of instructions
        // Note: In a real implementation, you might use a Web Worker
        // to prevent UI jank on heavy loads.
        for (let i = 0; i < this.executionSpeed; i++) {
            if (!this.cpu.step()) break; // CPU Halted or hit error
        }

        // Update Visualization (Map/Textures) based on new state
        this.updateVisualState();
    }

    start() {
        if (!this.cpu) return;
        this.isRunning = true;
        console.log("[CpuManager] CPU Started.");
    }

    stop() {
        this.isRunning = false;
        console.log("[CpuManager] CPU Stopped.");
    }

    // --- Internal IO & Visualization Handlers ---

    handleHalt() {
        this.isRunning = false;
        console.log("[CpuManager] CPU Halted.");
    }

    handleConsoleOutput(charCode) {
        // Bridge to PixiJS Console or Browser Console
        const char = String.fromCharCode(charCode);
        process.stdout.write(char); // Or dispatch event to UI
    }

    updateVisualState() {
        // Example: Update a texture based on memory mapped framebuffer
        // const fbData = this.cpu.memory.slice(FB_OFFSET, FB_OFFSET + FB_SIZE);
        // this.infiniteMap.updateFramebuffer(fbData);
    }

    setupDebugDisplay() {
        // Hook into PixiJS Ticker or Debug Overlay
        if (this.app.ticker) {
            this.app.ticker.add(() => this.stepFrame());
        }
    }
}
```

### 3. Next Step

**Command:** Create the `cpu_manager.js` file and update `infinite_map.js` to instantiate it.

```bash
# Create the new manager file
touch systems/visual_shell/web/cpu_manager.js

# (Manual Step) Paste the code above into the new file.
```

Once created, you will need to modify `infinite_map.js` to import `CpuManager` and call `cpuManager.initialize()` inside the map's `constructor` or `init` method.