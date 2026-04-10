# Build by Typing

## The Idea

Palette Forge is a pixel editor. Each pixel in the code grid is a machine instruction -- a 32-bit value where the red byte is the opcode, green is the stratum, blue is param1, and alpha is param2.

Until now, you build programs by clicking palette swatches and using +/- to adjust fields. That works but it's slow. You can't *read* what you've written without clicking each cell.

"Build by typing" lets you place instructions by pressing letter keys. Each letter maps to an opcode mnemonic:

```
A → ADD      B → BRANCH   C → CALL     D → SUB
E → EXEC     H → HALT     I → LDI      J → JMP
K → RET      L → LOAD     M → MOV      N → NOP
P → PSET     S → STORE
```

Press A, an ADD instruction appears. Press I, LDI appears. The cursor advances automatically, so you can type a sequence like `I I A H` to create "LDI, LDI, ADD, HALT" -- a minimal program.

## How It Works

### Prerequisites

You need a cell selected first. Click on any cell in the code grid. This sets the "cursor" -- the insertion point for typed instructions. If nothing is selected, letter keys do nothing.

### The Key → Opcode Map

The mapping goes through the palette table, not the opcode directly. Each letter resolves to a palette slot index, and the palette slot contains the instruction pixel for that opcode:

| Key | ASCII | Palette Slot | Opcode | Mnemonic |
|-----|-------|-------------|--------|----------|
| N   | 78    | 0           | 0      | NOP      |
| I   | 73    | 1           | 1      | LDI      |
| M   | 77    | 2           | 2      | MOV      |
| A   | 65    | 3           | 5      | ADD      |
| J   | 74    | 4           | 9      | JMP      |
| P   | 80    | 5           | 23     | PSET     |
| H   | 72    | 6           | 13     | HALT     |
| E   | 69    | 7           | 228    | EXEC     |
| B   | 66    | 8           | 10     | BRANCH   |
| C   | 67    | 9           | 11     | CALL     |
| K   | 75    | 10          | 12     | RET      |
| L   | 76    | 11          | 3      | LOAD     |
| S   | 83    | 12          | 4      | STORE    |
| D   | 68    | 13          | 6      | SUB      |

The indirect mapping through palette slots means the pixel that gets stamped includes the opcode AND whatever default field values are in the palette entry. For example, LDI (slot 1) stamps pixel `0x00000001` -- opcode=1, stratum=0, p1=0, p2=0. You'd then use +/- to set the register number and immediate value.

### The Stamp Sequence

When you press a mapped letter:

1. Look up the palette slot for that letter
2. Read the instruction pixel from `palette[slot].instr_pixel`
3. Write that pixel into the code region at the cursor position
4. Update the screen cell with the colormap color
5. Advance the cursor right by 1 pixel
6. If cursor reaches column 128, wrap to the next row
7. If cursor reaches row 96, wrap to row 0

The key is consumed -- it won't trigger again next frame.

### What Doesn't Map

Letters not in the table (F, G, O, Q, R, T, U, V, W, X, Y, Z) are ignored by the text handler. Some of these have existing bindings:
- R (82): SPAWN child VM (runs what you painted)
- Z (90): toggle zoom mode
- H (72): maps to HALT in text mode (no help toggle conflict since help isn't implemented yet)

Numbers, symbols, and arrow keys are not affected by text input mode.

## Building a Real Program

Here's how you'd write a program that loads 42 into r0 and halts:

1. Click cell at position (0, 0) to place the cursor
2. Press I -- stamps LDI at (0, 0), cursor moves to (1, 0)
3. Press I -- stamps LDI at (1, 0), cursor moves to (2, 0)  
4. Press H -- stamps HALT at (2, 0), cursor moves to (3, 0)

But wait -- LDI takes two pixels: the LDI opcode followed by a data pixel with the immediate value. The text handler only stamps the opcode. You still need +/- to set the data pixel's value. The sequence would actually be:

1. Click (0, 0)
2. Press I -- LDI at (0, 0), cursor at (1, 0)
3. Click (1, 0) to re-select it (text input moved the cursor but you need to set fields)
4. Use +/- to set p1 = 0 (register) and the next pixel to value 42

This is the current limitation: text input places opcodes, but field values (register numbers, immediates, addresses) still need the +/- inspector. A future enhancement could parse "I3" as "LDI r3" or "I042" as "LDI r0, 42".

## Relationship to Pixel Fonts

"Build by typing" is the input side of pixel fonts. The output side -- rendering opcode glyphs on screen so you can read the program visually -- requires zoom mode (8×8 cells with 5×7 bitmaps). The glyph table is designed but not yet wired into the renderer.

The eventual vision: you type `I A H` and the screen shows readable glyphs "LDI ADD HALT" in the code grid, each glyph drawn on a colored background. The text IS the program. The program IS pixels. No assembler, no text file, no compile step.

## Implementation Location

- Text input handler: `text_key_handler` subroutine in `programs/palette_forge.gasm`
- Key mapping table: hardcoded as BNE chains in the subroutine
- Palette slot data: `.ORG 0x280` section in `palette_forge.gasm`
- Zoom mode flag: address 0x403 in substrate RAM
- Zoom scroll offset: address 0x404 in substrate RAM
