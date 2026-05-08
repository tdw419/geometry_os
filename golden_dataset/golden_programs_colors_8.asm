; DESCRIPTION: Draw object: pos=the screen, color=red, size=fixed size.

; Colors -- fill screen with horizontal color bands
; Uses FILL in a loop to draw 4 color bands across the screen

LDI r9, 0xFF0000
FILL r9
LDI r9, 0x00FF00
FILL r9
LDI r9, 0x0000FF
FILL r9
LDI r9, 0xFFFF00
FILL r9
HALT
