; DESCRIPTION: This GeOS assembly code fills the screen with four horizontal color bands using the `FILL` instruction in a loop. The colors used are red, green, blue, and yellow, each filling one quarter of the screen.

; Colors -- fill screen with horizontal color bands
; Uses FILL in a loop to draw 4 color bands across the screen

LDI r15, 0xFF0000
FILL r15
LDI r15, 0x00FF00
FILL r15
LDI r15, 0x0000FF
FILL r15
LDI r15, 0xFFFF00
FILL r15
HALT
