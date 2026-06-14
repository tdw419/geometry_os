# CSV Animation Timeline Protocol (GeOS)

The **CSV Animation Timeline** is a declarative format for authoring Geometry OS animations and visual sequences without writing assembly manually. It acts as a high-level interchange format between GeOS and external visual systems like the Digital Visual Computer (GVPIE).

## The CSV Format

The file must include a header row and follows this schema:

```csv
frame,op,x,y,w,h,r,g,b,text
```

| Column | Description |
|--------|-------------|
| **frame** | The 0-indexed frame number. All rows with the same frame number are batched and rendered in a single "tick". |
| **op**    | The operation to perform (see [Operations](#operations)). |
| **x, y**  | Primary coordinates (0-255). |
| **w, h**  | Width/Height for rectangles, or secondary coordinates (X2/Y2) for lines. |
| **r, g, b**| Color components (0-255). |
| **text**  | String payload for text operations. |

## Operations

| Op | Description | GeOS Opcode |
|----|-------------|-------------|
| **TEXT** | Draws text with an optional background box if `w,h > 0`. | `DRAWTEXT` |
| **RECTF**| Draws a filled rectangle from `(x,y)` with dimensions `(w,h)`. | `RECTF` |
| **FILL** | Fills the entire screen with the specified color. | `FILL` |
| **LINE** | Draws a line from `(x,y)` to `(w,h)`. | `LINE` |
| **PSET** | Sets a single pixel at `(x,y)`. | `PSET` |
| **CLEAR**| Clears the screen using the background color (default black). | `FILL` |

## How it Works: `csv2asm.py`

The compiler (`scripts/csv2asm.py`) transforms the declarative CSV into an optimized GeOS assembly program (`.asm`).

1. **Batching**: It groups rows by `frame`. For each new frame number, it inserts the necessary number of `FRAME` opcodes to advance the VM's internal clock.
2. **Color Packing**: It converts RGB values into the `0xRRGGBB` hex format used by the VM.
3. **String Pooling**: All `TEXT` payloads are extracted into a `.str` pool at the end of the file to save memory and ensure unique labels.
4. **Setup Preamble**: It automatically configures the VM state (e.g., `FONT_SELECT 1` for 8x8 pixels).
5. **Looping**: With the `--loop` flag, it generates a `JMP` back to the start of the sequence after a final `FRAME` yield.

### Usage

```bash
# Basic compilation
python3 scripts/csv2asm.py my_animation.csv -o programs/my_anim.asm

# With background color and looping
python3 scripts/csv2asm.py my_animation.csv --bg 0x000033 --loop -o programs/my_anim.asm
```

## Architectural Integration

### 1. Visual Regression "Goldens"
The CSV serves as the "Expected State." A test harness can boot the compiled `.asm`, wait for `TICKS` to match a specific `frame`, and then use `PEEK` or a framebuffer dump to verify that the pixels match the CSV's intent.

### 2. Vision-Loop Interop
Geometry OS Area Agents often use LLMs (like Llama-3.2 Vision) to inspect regions. The CSV format allows the system to log "Visual Intent" which the LLM can compare against "Actual Substrate" to detect corruption or logic errors.

### 3. Cross-System Bridge
Since the format is shared with the **Digital Visual Computer (GVPIE)**, you can prototype a shader or animation in a high-level GPU environment and "drop" it onto the Geometry OS substrate as a native, executable program.

## Examples

See `examples/demo_timeline.csv` for a comprehensive demonstration of all operations.
