# Solution for Task: Buffer is limited to max lines

Here is the implementation plan for resolving the **"Buffer is limited to max lines"** issue within the context of the Pixel CPU - PixiJS Integration.

### 1. File Paths

*   **Modified**: `systems/visual_shell/web/pixel_cpu.js`
    *   *Reason*: Update `MemoryMappedIO` class to support circular buffers and fixed-size arrays.
*   **Modified**: `systems/visual_shell/web/infinite_map.js`
    *   *Reason*: Update `ConsoleLayer` to handle the fixed buffer size and implement the "scrolling" or "overwrite" logic when the limit is reached.
*   **Modified**: `systems/visual_shell/web/cpu_visualizer.js`
    *   *Reason*: Ensure the visualizer renders only the active buffer window.

### 2. Code Implementation

We need to enforce a maximum line count (e.g., 256 lines) to prevent memory overflow during infinite CPU execution. We will implement a **Circular Buffer** approach for the console output.

#### A. Update Memory-Mapped I/O (The Model)
*File*: `systems/visual_shell/web/pixel_cpu.js`

We modify the `MemoryMappedIO` class to handle a fixed-size buffer. When the buffer is full, new lines overwrite the oldest ones.

```javascript
class MemoryMappedIO {
    constructor(memorySize, maxConsoleLines = 256) {
        this.mem = new Uint8Array(memorySize);
        this.maxLines = maxConsoleLines;
        // Initialize console buffer with empty strings
        this.consoleBuffer = new Array(maxConsoleLines).fill(''); 
        this.consoleHead = 0; // Points to the current write position
    }

    // Simulating a write to the Console MMIO address
    // (e.g., CPU writes string to a specific address range)
    writeToConsole(text) {
        const lines = text.split('\n');
        
        lines.forEach(line => {
            // Store the line at the current head
            this.consoleBuffer[this.consoleHead] = line;
            
            // Move head forward, wrapping around using modulo
            this.consoleHead = (this.consoleHead + 1) % this.maxLines;
        });
    }

    // Helper to get the displayable lines in order
    // Returns an array where the newest line is conceptually at the end
    getDisplayLines() {
        const result = [];
        for (let i = 0; i < this.maxLines; i++) {
            // Calculate index based on head to read buffer in chronological order
            // We start reading from (head) to (head + max)
            // But for display, we usually want oldest first.
            // If head is at 5, oldest data is at 5.
            
            // Actually, simpler logic for a ring buffer display:
            // The buffer is filled 0 -> N. If head > 0, data at 0 is old.
            // If it wraps, data at 0 is new.
            
            let idx = (this.consoleHead + i) % this.maxLines;
            // Check if this slot has been initialized/written to
            if (this.consoleBuffer[idx] !== undefined) {
               result.push(this.consoleBuffer[idx]);
            }
        }
        return result;
    }
    
    // Get raw buffer for the PixiJS layer to consume
    getConsoleState() {
        return {
            buffer: this.consoleBuffer,
            head: this.consoleHead,
            max: this.maxLines
        };
    }
}
```

#### B. Update PixiJS Infinite Map (The View)
*File*: `systems/visual_shell/web/infinite_map.js`

We need to update the `ConsoleLayer` to strictly render the number of lines allowed by the texture height and the buffer limit.

```javascript
import { Container, Text, Graphics } from 'pixi.js';

export class ConsoleLayer extends Container {
    constructor(cpu) {
        super();
        this.cpu = cpu;
        this.maxLines = 256; // Must match CPU MMIO
        this.lineHeight = 16;
        
        // Object pool for text objects to avoid Garbage Collection
        this.textPool = [];
        for(let i = 0; i < this.maxLines; i++) {
            const txt = new Text('', {
                fontFamily: 'monospace',
                fontSize: 12,
                fill: 0x00FF00 // Terminal Green
            });
            txt.y = i * this.lineHeight;
            this.textPool.push(txt);
            this.addChild(txt);
        }
    }

    update() {
        const state = this.cpu.io.getConsoleState();
        const { buffer, head, max } = state;

        // Render the circular buffer
        // We want the oldest line at the top (index 0 of screen)
        // and the newest line at the bottom.
        
        for (let i = 0; i < max; i++) {
            // Calculate which index in the circular buffer corresponds to this visual line
            // Visual line 0 should be the oldest data.
            // If head is pointing to the *next* write slot, then 'head' is the oldest data?
            // No, if head just wrote to index 5, then 5 is newest. 0 is oldest (if not wrapped).
            
            // Let's rely on the logic: 
            // The visual line `i` corresponds to buffer index `(head + i) % max`
            // ONLY IF we treat `head` as the start of the data.
            
            // Correct Logic for "Scrolling" view:
            // We want the log to look like a continuous stream.
            // The visual line 0 should correspond to the oldest valid data.
            
            let bufferIndex = (head + i) % max;
            
            // Optimization: PixiJS Text update
            this.textPool[i].text = buffer[bufferIndex] || '';
        }
    }
}
```

### 3. Next Step

**Command:** Create a new test file to verify the circular buffer logic before integrating it into the PixiJS render loop.

```bash
# Create a unit test for the buffer logic
touch systems/visual_shell/web/tests/pixel_cpu_buffer.test.js
```