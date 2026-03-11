# Solution for Task: Text object displays console buffer

Here is the implementation plan for integrating the Pixel CPU with the PixiJS Infinite Map, specifically focusing on the **Console Buffer** task.

### 1. File Paths

**New Files**
*   `systems/visual_shell/web/cpu_text_renderer.js`
    *   **Purpose**: Contains the `CpuConsoleText` class. This class manages the PixiJS `BitmapText` object, subscribes to CPU memory changes, and formats the raw memory bytes into a readable grid of characters.

**Modified Files**
*   `systems/visual_shell/web/infinite_map.js`
    *   **Purpose**: Integrate the `CpuConsoleText` instance into the scene graph and manage its lifecycle (adding/removing from the container).
*   `systems/visual_shell/web/pixel_cpu.js`
    *   **Purpose**: Define the Memory-Mapped I/O (MMIO) address range for the console (e.g., `0x8000_0000`) so the renderer knows where to read data.

---

### 2. Implementation Code

We will create a renderer that reads from a specific memory address (MMIO) and updates a PixiJS BitmapText object.

#### `systems/visual_shell/web/cpu_text_renderer.js`

```javascript
import { BitmapText } from 'pixi.js';

/**
 * MMIO Address Constants
 * The CPU will write ASCII bytes to CONSOLE_BASE.
 */
const CONSOLE_BASE = 0x80000000;
const CONSOLE_ROWS = 25;
const CONSOLE_COLS = 80;

export class CpuConsoleText {
    /**
     * @param {import('./pixel_cpu.js').PixelCPU} cpu - The CPU instance to observe.
     * @param {Object} options - PixiJS styling options.
     */
    constructor(cpu, options = {}) {
        this.cpu = cpu;
        this.address = CONSOLE_BASE;
        
        // Initialize the PixiJS BitmapText object
        // Using a default font name; assumes 'font.fnt' is loaded in the asset bundle
        this.view = new BitmapText('', {
            fontName: 'default_font', // Ensure this matches your loaded Pixi font name
            fontSize: 16,
            tint: 0x00FF00, // Matrix green
            align: 'left'
        });

        this.view.x = options.x || 20;
        this.view.y = options.y || 20;
        
        // Optimization: Track last update to avoid re-rendering identical memory
        this.lastRenderState = '';
    }

    /**
     * Call this once per frame (inside the InfiniteMap loop)
     */
    update() {
        if (!this.cpu) return;

        // 1. Read raw bytes from CPU Memory
        // We read a chunk of memory representing the text buffer
        const bufferString = this.readMemoryBuffer();

        // 2. Optimization: Only update PixiJS text if content changed
        if (bufferString !== this.lastRenderState) {
            this.view.text = bufferString;
            this.lastRenderState = bufferString;
        }
    }

    /**
     * Helper to read linear memory and format into newlines
     */
    readMemoryBuffer() {
        let output = '';
        
        for (let row = 0; row < CONSOLE_ROWS; row++) {
            let rowText = '';
            for (let col = 0; col < CONSOLE_COLS; col++) {
                // Calculate offset: Base + (Row * Cols) + Col
                const offset = (row * CONSOLE_COLS) + col;
                const byte = this.cpu.ram.read8(this.address + offset);
                
                // Convert byte to ASCII character
                // Filter null bytes for cleaner rendering
                rowText += byte === 0 ? ' ' : String.fromCharCode(byte);
            }
            output += rowText + '\n';
        }
        return output;
    }

    destroy() {
        this.view.destroy();
    }
}
```

#### Integration Snippet for `infinite_map.js`

```javascript
import { CpuConsoleText } from './cpu_text_renderer.js';

class InfiniteMap {
    // ... existing properties ...
    constructor(cpu) {
        this.cpu = cpu;
        this.consoleRenderer = new CpuConsoleText(this.cpu, { x: 50, y: 50 });
        this.container.addChild(this.consoleRenderer.view);
    }

    update() {
        // ... existing map logic ...
        
        // Update the console visualization
        this.consoleRenderer.update();
    }
}
```

---

### 3. Next Step

**Command:** Create the `cpu_text_renderer.js` file and add the import to `infinite_map.js`.

```bash
# Create the new renderer component
touch systems/visual_shell/web/cpu_text_renderer.js
```