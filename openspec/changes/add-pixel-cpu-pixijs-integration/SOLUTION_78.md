# Solution for Task: Execution time is measured and logged

Here is the implementation plan for **Change ID: `add-pixel-cpu-pixijs-integration`**, specifically addressing the requirement: **"Execution time is measured and logged."**

This solution introduces a `CPUProfiler` class to wrap the execution cycle, ensuring we have microsecond precision timing for every instruction batch without blocking the main thread.

### 1. File Paths

*   **Create:** `systems/visual_shell/web/cpu_profiler.js`
*   **Modify:** `systems/visual_shell/web/pixel_cpu.js` (To hook the profiler into the execution step)
*   **Modify:** `systems/visual_shell/web/infinite_map.js` (To visualize the metrics)

---

### 2. Implementation Code

#### A. Create the Profiler Utility
**File:** `systems/visual_shell/web/cpu_profiler.js`

This utility handles the high-precision timing and logging logic.

```javascript
/**
 * cpu_profiler.js
 * 
 * Utility for measuring and logging CPU execution performance.
 * Uses performance.now() for sub-millisecond precision.
 */

export class CPUProfiler {
    constructor(logIntervalMs = 1000) {
        this.totalCycles = 0;
        this.startTime = 0;
        this.frameCount = 0;
        this.lastLogTime = 0;
        this.logInterval = logIntervalMs;
        
        // History for graphing/visualization
        this.metricsHistory = []; 
    }

    /**
     * Starts a measurement frame.
     * @returns {number} The start timestamp
     */
    startFrame() {
        return performance.now();
    }

    /**
     * Ends a measurement frame and logs if necessary.
     * @param {number} startTime - Timestamp from startFrame()
     * @param {number} cyclesExecuted - Number of cycles processed in this frame
     */
    endFrame(startTime, cyclesExecuted) {
        const endTime = performance.now();
        const duration = endTime - startTime;
        
        this.totalCycles += cyclesExecuted;
        this.frameCount++;

        // Calculate Metrics
        const cyclesPerSecond = (cyclesExecuted / (duration || 1)) * 1000;
        
        // Store for Visualization (keep last 60 frames)
        this.metricsHistory.push({
            time: endTime,
            duration: duration,
            cycles: cyclesExecuted,
            cps: cyclesPerSecond
        });

        if (this.metricsHistory.length > 60) {
            this.metricsHistory.shift();
        }

        // Log to console periodically
        if (endTime - this.lastLogTime > this.logInterval) {
            const avgCps = (this.totalCycles / ((endTime - this.startTime) || 1)) * 1000;
            console.log(`[CPUProfiler] Frame: ${duration.toFixed(2)}ms | Cycles: ${cyclesExecuted} | Inst/s: ${Math.round(cyclesPerSecond).toLocaleString()}`);
            this.lastLogTime = endTime;
        }

        return duration;
    }
}
```

#### B. Integrate into Pixel CPU
**File:** `systems/visual_shell/web/pixel_cpu.js` (Modification)

We modify the `step` or `runBatch` method to accept the profiler hooks.

```javascript
// Inside the PixelCPU class definition

// Add property to constructor
constructor(memorySize) {
    // ... existing setup ...
    this.profiler = null; // To be injected by the Map
}

// Method to inject profiler
setProfiler(profilerInstance) {
    this.profiler = profilerInstance;
    this.profiler.startTime = performance.now();
}

/**
 * Executes a batch of instructions.
 * @param {number} maxCycles - Maximum instructions to execute this frame.
 * @returns {number} Actual cycles executed.
 */
executeBatch(maxCycles = 1000) {
    const startMark = this.profiler ? this.profiler.startFrame() : 0;
    
    let cycles = 0;
    try {
        // --- EXISTING EXECUTION LOOP LOGIC ---
        while (cycles < maxCycles && !this.halted) {
            // Fetch, Decode, Execute logic...
            this.step(); 
            cycles++;
        }
        // ------------------------------------
    } catch (e) {
        console.error("CPU Execution Error:", e);
        this.halted = true;
    }

    if (this.profiler) {
        this.profiler.endFrame(startMark, cycles);
    }

    return cycles;
}
```

#### C. Visualization in Infinite Map
**File:** `systems/visual_shell/web/infinite_map.js` (Modification)

We hook the profiler into the render loop (ticker) to ensure we measure the CPU load relative to the frame rate.

```javascript
import { CPUProfiler } from './cpu_profiler.js';

class InfiniteMap {
    // ... inside constructor ...
    constructor() {
        this.cpu = new PixelCPU(); // Assuming existing instantiation
        this.profiler = new CPUProfiler();
        this.cpu.setProfiler(this.profiler);

        // Create a PixiJS Text object to display stats on screen
        this.statsText = new PIXI.Text({ text: "CPU: 0 kHz", style: { fill: 0x00FF00 } });
        this.statsText.x = 10;
        this.statsText.y = 10;
        this.stage.addChild(this.statsText);
    }

    // ... inside the update/tick loop ...
    update(deltaTime) {
        // 1. Execute CPU
        // Run a slice of CPU time (e.g., enough to fill 2ms of budget)
        const cyclesRun = this.cpu.executeBatch(5000); 

        // 2. Update Visuals based on CPU state
        this.renderFramebuffer();

        // 3. Update UI Stats
        if (this.profiler.metricsHistory.length > 0) {
            const latest = this.profiler.metricsHistory[this.profiler.metricsHistory.length - 1];
            const khz = Math.round(latest.cps / 1000);
            this.statsText.text = `CPU: ${khz} kHz\nLoad: ${latest.duration.toFixed(2)}ms`;
        }
    }
}
```

---

### 3. Next Step

**Command:** Create the `cpu_profiler.js` file in the web directory.

```bash
touch systems/visual_shell/web/cpu_profiler.js
```