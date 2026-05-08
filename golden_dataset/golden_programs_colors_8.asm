; DESCRIPTION: This GeOS assembly code fills the screen with four horizontal color bands using the `FILL` instruction in a loop. The colors used are red, green, blue, and yellow, each filling one quarter of the screen.

; Colors -- fill screen with horizontal color bands
; Uses FILL in a loop to draw 4 color bands across the screen

LDI r14, 0xFF0000
FILL r14
LDI r14, 0x00FF00
FILL r14
LDI r14, 0x0000FF
FILL r14
LDI r14, 0xFFFF00
FILL r14
HALT
