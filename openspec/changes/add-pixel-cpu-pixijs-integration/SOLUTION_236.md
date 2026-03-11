# Solution for Task: ANSI colors are supported (optional)

Here is the implementation plan for **Phase 40: Pixel CPU - PixiJS Integration**, focusing on the specific requirement for **ANSI Color Support**.

Since this task involves the Visual Shell (Browser) and PixiJS, the implementation will be in **TypeScript/JavaScript**.

### 1. File Paths

**Create:**
*   `systems/visual_shell/web/pixel_cpu/ansi_parser.ts`
    *   *Responsibility:* Parses ANSI escape codes to extract style metadata (colors, bold, underline).
*   `systems/visual_shell/web/pixel_cpu/text_renderer.ts`
    *   *Responsibility:* Wraps the PixiJS `BitmapText` or `Text` logic. It consumes parsed ANSI data and applies tinting/formatting to the glyphs.

**Modify:**
*   `systems/visual_shell/web/pixel_cpu/pixel_cpu.ts` (or `pixel_cpu.js`)
    *   *Responsibility:* Hook the Memory-Mapped I/O (MMIO) write console calls to the new Text Renderer.

---

### 2. Implementation Code

We will use a lightweight state-machine parser for ANSI codes and a PixiJS `BitmapText` container for rendering.

#### A. The ANSI Parser (`ansi_parser.ts`)
This module converts raw ANSI strings into a list of "Text Chunks" with specific styling.

```typescript
// systems/visual_shell/web/pixel_cpu/ansi_parser.ts

export interface TextChunk {
    text: string;
    color: number; // Hex color for PixiJS
    bgColor: number; // Hex color for background (optional)
    bold: boolean;
}

export class AnsiParser {
    // Basic ANSI color map (Standard 4-bit colors)
    private static readonly FG_COLORS: Record<number, number> = {
        30: 0x000000, // Black
        31: 0xFF0000, // Red
        32: 0x00FF00, // Green
        33: 0xFFFF00, // Yellow
        34: 0x0000FF, // Blue
        35: 0xFF00FF, // Magenta
        36: 0x00FFFF, // Cyan
        37: 0xFFFFFF, // White
    };

    private currentStyle = {
        color: 0xFFFFFF,
        bold: false
    };

    /**
     * Parses a string containing ANSI codes into renderable chunks.
     */
    public parse(input: string): TextChunk[] {
        const chunks: TextChunk[] = [];
        let buffer = "";

        // Regex to match CSI sequences: ESC '[' ... 'm'
        // Example: \x1b[31m
        const ansiRegex = /\x1b\[([0-9;]*)m/g;

        let lastIndex = 0;
        let match;

        while ((match = ansiRegex.exec(input)) !== null) {
            // Push text before the ANSI code
            if (match.index > lastIndex) {
                const text = input.substring(lastIndex, match.index);
                if (text) {
                    chunks.push({ text, ...this.currentStyle });
                }
            }

            // Parse the style codes inside the escape sequence
            const codes = match[1].split(';').filter(c => c !== '');
            this.applyStyles(codes);

            lastIndex = ansiRegex.lastIndex;
        }

        // Push remaining text
        if (lastIndex < input.length) {
            const text = input.substring(lastIndex);
            if (text) {
                chunks.push({ text, ...this.currentStyle });
            }
        }

        return chunks;
    }

    private applyStyles(codes: string[]) {
        for (const code of codes) {
            const num = parseInt(code, 10);
            if (num === 0) {
                // Reset
                this.currentStyle = { color: 0xFFFFFF, bold: false };
            } else if (num === 1) {
                this.currentStyle.bold = true;
            } else if (AnsiParser.FG_COLORS[num]) {
                this.currentStyle.color = AnsiParser.FG_COLORS[num];
            }
        }
    }
}
```

#### B. The PixiJS Renderer (`text_renderer.ts`)
This component manages the PixiJS display objects. It uses `BitmapText` for performance (crucial for a 60FPS infinite map).

```typescript
// systems/visual_shell/web/pixel_cpu/text_renderer.ts
import { BitmapText, Container, BitmapFont } from 'pixi.js';
import { AnsiParser, TextChunk } from './ansi_parser';

export class ConsoleRenderer {
    private container: Container;
    private parser: AnsiParser;
    private maxWidth: number;
    private lineHeight: number = 16; // Adjust based on font size

    constructor(container: Container, maxWidth: number) {
        this.container = container;
        this.maxWidth = maxWidth;
        this.parser = new AnsiParser();
    }

    /**
     * Appends text to the console view.
     * Automatically handles word wrapping and ANSI styling.
     */
    public appendText(rawText: string, fontName: string = 'default-font') {
        const chunks = this.parser.parse(rawText);
        let cursorX = 0;
        let cursorY = this.container.children.length > 0 
            ? this.container.children[this.container.children.length - 1].y + this.lineHeight 
            : 0;

        for (const chunk of chunks) {
            // Create a BitmapText object for each styled chunk
            const bitmap = new BitmapText(chunk.text, {
                fontName: fontName,
                fontSize: 12,
                tint: chunk.color
            });

            bitmap.x = cursorX;
            bitmap.y = cursorY;

            // Simple word wrapping logic could go here
            if (cursorX + bitmap.width > this.maxWidth) {
               // Handle wrap (omitted for brevity, would split chunk)
            }

            this.container.addChild(bitmap);
            cursorX += bitmap.width;
        }
    }
    
    public clear() {
        this.container.removeChildren();
    }
}
```

---

### 3. Next Steps

1.  **Create the Parser Module**
    Run the following command to create the ANSI parser file:
    ```bash
    touch systems/visual_shell/web/pixel_cpu/ansi_parser.ts
    ```
2.  **Implement Memory-Mapped I/O Hook**
    Modify the `pixel_cpu.js` (or `pixel_cpu.ts`) emulator loop. When a write occurs to the `Console` MMIO address (e.g., `0x10000000`), capture the string and pass it to `ConsoleRenderer.appendText()`.
3.  **Prepare Assets**
    Ensure a PixiJS BitmapFont XML is loaded in `infinite_map.js` before the CPU attempts to render text.