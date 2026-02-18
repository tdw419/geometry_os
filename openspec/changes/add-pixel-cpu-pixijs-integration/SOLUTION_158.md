# Solution for Task: Performance metrics are logged

Here is the implementation plan for the **Performance Metrics Logging** feature within the Pixel CPU - PixiJS Integration.

### 1. File Paths

To achieve non-blocking execution and real-time visualization while logging metrics, we need to create a dedicated metrics module and hook it into the CPU execution loop.

*   **Create:** `systems/visual_shell/web/cpu_metrics.js` (New module for collecting and formatting performance data)
*   **Modify:** `systems/visual_shell/web/pixel_cpu.js` (To hook into the instruction cycle)
*   **Modify:** `systems/visual_shell/web/infinite_map.js` (To visualize the data on the map)

### 2. Implementation Code

#### A. Create Metrics Module (`systems/visual_shell/web/cpu_metrics.js`)
This module uses a circular buffer to store execution history without causing memory leaks, and calculates an exponential moving average for smooth FPS/load reporting.

```javascript
// systems/visual_shell/web/cpu_metrics.js

export class CPUMetrics {
    constructor(historySize = 60) {
        this.historySize = historySize;
        this.reset();
    }

    reset() {
        this.instructionsExecuted = 0;
        this.startTime = performance.now();
        this.lastLogTime = this.startTime;
        
        // Circular buffer for frame history (stores instruction count per frame)
        this.frameHistory = new Array(this.historySize).fill(0);
        this.historyIndex = 0;
        
        // Calculated metrics
        this.currentIPS = 0; // Instructions Per Second
        this.estimatedLoad = 0; // 0.0 to 1.0
    }

    /**
     * Call this at the start of every render frame (requestAnimationFrame)
     */
    tick() {
        const now = performance.now();
        const delta = now - this.lastLogTime;
        
        // Only update calculations every 100ms to avoid jitter
        if (delta > 100) {
            this.calculateMetrics(now, delta);
            this.lastLogTime = now;
        }
    }

    /**
     * Call this inside the CPU execution loop to count work
     */
    logInstructions(count) {
        this.frameHistory[this.historyIndex] += count;
    }

    calculateMetrics(now, deltaMs) {
        // Calculate IPS based on the most recent frame slot
        const instructionsInFrame = this.frameHistory[this.historyIndex];
        const instantIPS = (instructionsInFrame / deltaMs) * 1000;
        
        // Simple Low-Pass Filter (Exponential Moving Average)
        this.currentIPS = this.currentIPS * 0.9 + instantIPS * 0.1;

        // Estimate Load: Assuming 100k IPS is 100% load for a generic target
        // In a real system, this would be (Time Executing / Total Time)
        const targetIPS = 50000; 
        this.estimatedLoad = Math.min(this.currentIPS / targetIPS, 1.0);

        // Advance circular buffer
        this.frameHistory[this.historyIndex] = 0; // Clear for next frame
        this.historyIndex = (this.historyIndex + 1) % this.historySize;
    }

    getData() {
        return {
            ips: Math.floor(this.currentIPS),
            load: this.estimatedLoad,
            uptime: performance.now() - this.startTime
        };
    }
}
```

#### B. Modify `pixel_cpu.js` (Integration Snippet)
Add a hook inside the execution loop. Note that we execute in chunks to allow the renderer to breathe.

```javascript
// Inside PixelCPU class

setMetrics(metricsInstance) {
    this.metrics = metricsInstance;
}

// Inside runFrame or executeStep method
executeChunk(instructionsPerChunk) {
    const start = performance.now();
    let count = 0;
    
    // Execute RISC-V instructions
    while (count < instructionsPerChunk) {
        // ... existing CPU logic (fetch, decode, execute) ...
        this.step(); 
        count++;
    }

    // Log the work done
    if (this.metrics) {
        this.metrics.logInstructions(count);
    }
}
```

#### C. Modify `infinite_map.js` (Visualizing Metrics)
Update the PixiJS container to render the stats.

```javascript
// Inside InfiniteMap class
import { CPUMetrics } from './cpu_metrics.js';

constructor() {
    // ... existing setup ...
    this.metrics = new CPUMetrics();
    this.cpu.setMetrics(this.metrics); // Wire CPU to metrics

    // Create UI Text
    this.statsText = new PIXI.Text({
        text: "CPU: OFF",
        style: { fill: 0x00FF00, fontSize: 14, fontFamily: 'monospace' }
    });
    this.statsText.x = 10;
    this.statsText.y = 10;
    this.addChild(this.statsText);
}

onRender() {
    // 1. Tell metrics system a frame has started
    this.metrics.tick();

    // 2. Run CPU for a slice of time (Non-blocking)
    if (this.cpu.isRunning) {
        // Execute up to 5000 instructions per frame to maintain 60fps
        this.cpu.executeChunk(5000); 
    }

    // 3. Update Visuals
    const data = this.metrics.getData();
    this.statsText.text = `
        IPS: ${data.ips.toLocaleString()}
        LOAD: ${(data.load * 100).toFixed(1)}%
        UPTIME: ${(data.uptime / 1000).toFixed(1)}s
    `;
    
    // Visual feedback: Change color based on load
    if (data.load > 0.8) this.statsText.style.fill = 0xFF0000; // Red
    else if (data.load > 0.5) this.statsText.style.fill = 0xFFFF00; // Yellow
    else this.statsText.style.fill = 0x00FF00; // Green
}
```

### 3. Next Step

Create the metrics module file to define the performance tracking logic.

```bash
touch systems/visual_shell/web/cpu_metrics.js
```