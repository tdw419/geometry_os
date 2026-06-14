# CSV Timeline Compiler (csv2asm)

The `csv2asm.py` script is the downstream stage of the visual pipeline. It compiles declarative CSV timelines into optimized Geometry OS assembly.

## Key Features
- **Frame Batching:** Automatically handles `FRAME` yields between frame groups.
- **String Pooling:** Efficiently manages text strings for `DRAWTEXT` operations.
- **Looping Support:** Generates infinite loops for animations with the `--loop` flag.
- **Background Configuration:** Sets the initial screen state via `--bg`.

## Pipeline Position
1. **Source:** PNG frames or high-level visual descriptions.
2. **Intermediate:** `img2csv.py` (optimized CSV emission).
3. **Compiler:** `csv2asm.py` (assembly generation).
4. **Execution:** Geometry OS VM runs the `.asm` binary.

## Usage
```bash
python3 scripts/csv2asm.py timeline.csv --output program.asm --loop
```
