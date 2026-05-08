; DESCRIPTION: The GeOS assembly code fills the entire screen with a solid bright blue color by setting each of the 65536 pixels to the hexadecimal value 0x0000FF. The `LDI` instruction loads the color into register `r14`, and the `FILL` opcode then applies this color to every pixel on the screen, followed by a `HALT` instruction to terminate execution.

; FILL_SCREEN -- Fill the screen with a solid color
; Uses FILL opcode to set every pixel to bright blue
; Test: all 65536 screen pixels should be 0x0000FF

LDI r14, 0x0000FF
FILL r14
HALT
