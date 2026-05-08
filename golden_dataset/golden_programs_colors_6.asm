; DESCRIPTION: A red object centered at the screen with fixed size.

; Colors -- fill screen with horizontal color bands
; Uses FILL in a loop to draw 4 color bands across the screen

LDI r1, 0xFF0000
FILL r1
LDI r1, 0x00FF00
FILL r1
LDI r1, 0x0000FF
FILL r1
LDI r1, 0xFFFF00
FILL r1
HALT
