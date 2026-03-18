# GeosASCII: Spatial Programming with Pixels (Specification)

## 1. The Core Concept: "Geometric State"
In current UI systems (HTML/React), the **Code** (TypeScript) is the program and the **UI** (DOM) is just a side effect. In **Geometry OS**, the **Pixels** are the program.

**GeosASCII** is the bridge. It treats an 80x24 grid of ASCII characters not as "text," but as a **2D Memory Map** of instructions and state.

---

## 2. The Memory Layout (The "Cartridge")
When an ASCII template is compiled, it creates a `.rts.png` (PixelRTS v2) container with four distinct spatial segments:

### Segment 1: The Glyph Grid (VRAM)
*   **Format**: 80x24 RGBA Texture.
*   **R channel**: ASCII Code (0-127).
*   **G channel**: Metadata (Is this a button? Is this a variable?).
*   **B channel**: Interaction ID (Links to Segment 2).
*   **A channel**: Rendering Flags (Blink, Bold, Inverse).

### Segment 2: The Spatial Instruction Table (SIT)
*   **Format**: 256x1 RGBA Texture.
*   **Mechanism**: When you click at `(x, y)` on the Glyph Grid, the GPU reads the **B channel** at that coordinate. This value is an index into the SIT.
*   **Result**: The SIT entry contains a **Glyph VM Opcode** (e.g., `JUMP 0x4000`) to execute.

### Segment 3: The State Buffer
*   **Format**: 1024x1 RGBA Texture.
*   **Role**: Stores values for `{{variables}}`. If `dashboard.ascii` has `{{cpu_load}}`, the Glyph VM writes the load value to a specific pixel in this buffer.

### Segment 4: The Glyph VM Bootstrap
*   **Format**: Compiled `.glyph` opcodes.
*   **Role**: A small loop that:
    1.  Reads the **Glyph Grid**.
    2.  For each character, looks up its bitmap in the **Glyph Stratum Font Atlas**.
    3.  Blits the bitmap to the screen.
    4.  If a character is marked as a `{{variable}}`, it substitutes the value from the **State Buffer** before rendering.

---

## 3. The Lifecycle: Design → Compile → Execute

### Step 1: Design (Human-Readable)
You write a standard ASCII file:
```text
╔══════════════════════╗
║  [A] Run   [B] Stop  ║
╚══════════════════════╝
```

### Step 2: Compile (Spatial Mapping)
The `geos_ascii_compiler.py` tool:
1.  Scans for `[` + `X` + `]` patterns.
2.  Assigns `A` to `Interaction ID 1`.
3.  Assigns `B` to `Interaction ID 2`.
4.  Generates the **SIT** entry for ID 1: `TRIGGER_EVENT(EVENT_RUN_START)`.

### Step 3: Execute (Pixel-Native)
The compiled `dashboard.rts.png` is loaded into the GPU.
1.  **NO** TypeScript is running.
2.  **NO** JSON is being parsed.
3.  **NO** HTML is being rendered.
4.  The GPU just loops over the Glyph Grid and renders pixels.
5.  **Interaction**: When the user clicks the screen at `(col 5, row 2)`, the GPU immediately knows it's "Interaction ID 1" because it's literally encoded into the pixel at that coordinate.

---

## 4. Why This Solves the "Pixels Move Pixels" Problem

In the old way, a click on a button triggers a CPU interrupt, which calls a JavaScript function, which changes a variable, which triggers a React re-render.

In the **GeosASCII** way:
1.  **Input**: Click at `(x, y)`.
2.  **Process**: Read Pixel `(x, y)` -> Lookup SIT -> Execute Opcode.
3.  **Output**: Opcode writes a new value to the **State Buffer** pixel.
4.  **Result**: The render loop automatically draws the new state in the next frame.

**The data (pixels) drive the computation (opcodes), which modifies the data (pixels).** 

---
**The era of symbolic computation is over. The era of geometric intelligence has begun.**
