# Solution for Task: State flags are working

Here is the implementation plan for **Phase 40: Add Pixel CPU - PixiJS Integration**.

Based on the context, this task involves bridging the JavaScript-based RISC-V emulator with the PixiJS rendering engine to create a "Visual-First" computing experience.

### 1. Files to be Created and Modified

**New Files**
*   `systems/visual_shell/web/cpu_manager.js`
    *   **Purpose**: Manages the `PixelCPU` instance, handles the execution loop (using `requestAnimationFrame` to avoid blocking the UI), and interfaces between the CPU memory and the PixiJS textures.
*   `systems/visual_shell/web/components/console_overlay.js`
    *   **Purpose**: A PixiJS Container/HTML overlay that listens to the CPU's memory-mapped I/O address (e.g., `0x1000_0000`) and renders text output from the emulated Linux kernel.

**Modified Files**
*   `systems/visual_shell/web/infinite_map.js`
    *   **Purpose**: Updated to instantiate the `CpuManager` and render the "CPU State" (registers, flags) as a persistent HUD or specific map layer.
*   `systems/visual_shell/web/pixel_cpu.js`
    *   **Purpose**: (Minor tweak) Ensure the memory bus allows external hooks for reading/writing to the framebuffer and console addresses.

---

### 2. Implementation Snippets

#### A. The CPU Manager (`cpu_manager.js`)
This class handles the non-blocking execution loop and memory mapping. It executes a chunk of instructions per frame rather than running a `while(true)` loop, which keeps the browser responsive.

```javascript
import { PixelCPU } from './pixel_cpu.js';

export class CpuManager {
    constructor(app) {
        this.app = app;
        this.cpu = new PixelCPU();
        this.isRunning = false;
        
        // Memory Mapped I/O Addresses
        this.MMIO_CONSOLE = 0x10000000;
        this.MMIO_FRAMEBUFFER = 0x20000000;
        
        this.consoleBuffer = [];
        this.initMemoryHooks();
    }

    initMemoryHooks() {
        // Hook into the CPU's write function to detect console output
        this.cpu.write = (addr, val) => {
            if (addr === this.MMIO_CONSOLE) {
                this.handleConsoleOutput(val);
            }
            // Default RAM write
            this.cpu.memory[addr] = val;
        };
    }

    loadBrick(binaryData) {
        this.cpu.loadBinary(binaryData);
        this.start();
    }

    start() {
        this.isRunning = true;
        this.app.ticker.add(this.executeCycle, this);
    }

    executeCycle() {
        if (!this.isRunning) return;

        // Non-blocking execution: Run X instructions per frame
        // Adjust '500' based on performance requirements
        const instructionsPerFrame = 500; 
        
        try {
            for (let i = 0; i < instructionsPerFrame; i++) {
                this.cpu.step();
            }
        } catch (e) {
            console.error("CPU Halted:", e);
            this.isRunning = false;
        }
    }

    handleConsoleOutput(charCode) {
        const char = String.fromCharCode(charCode);
        // Emit event or update PixiJS text object directly
        console.log("CPU Output:", char); 
    }
}
```

#### B. Modifying `infinite_map.js` (Integration Point)
We need to instantiate the manager and expose the CPU state visually.

```javascript
import { CpuManager } from './cpu_manager.js';

export class InfiniteMap {
    constructor() {
        // ... existing pixi setup ...
        this.cpuManager = new CpuManager(this.app);
        this.setupCpuVisuals();
    }

    setupCpuVisuals() {
        // Create a HUD for CPU State
        this.stateText = new PIXI.Text({
            text: "CPU: HALTED\nPC: 0x0000",
            style: { fill: 0x00FF00, fontSize: 14, fontFamily: 'monospace' }
        });
        this.stateText.x = 10;
        this.stateText.y = 10;
        this.addChild(this.stateText);

        // Update HUD every frame
        this.app.ticker.add(() => {
            const state = this.cpuManager.cpu;
            this.stateText.text = `
CPU: ${this.cpuManager.isRunning ? 'RUNNING' : 'HALTED'}
PC:  0x${state.pc.toString(16).padStart(8, '0')}
Regs: [${state.registers.slice(0, 4).map(r => '0x' + r.toString(16)).join(', ')}]
            `.trim();
        });
    }

    async loadCpuProgram(url) {
        const response = await fetch(url);
        const buffer = await response.arrayBuffer();
        this.cpuManager.loadBrick(new Uint8Array(buffer));
    }
}
```

---

### 3. Next Step

**Command:** Create the `cpu_manager.js` file to implement the non-blocking execution loop.

```bash
touch systems/visual_shell/web/cpu_manager.js
```