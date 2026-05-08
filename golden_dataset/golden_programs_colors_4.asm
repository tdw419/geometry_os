; DESCRIPTION: Draw object: pos=the screen, color=red, size=fixed size.

; Colors -- fill screen with horizontal color bands
; Uses FILL in a loop to draw 4 color bands across the screen

LDI r12, 0xFF0000
FILL r12
LDI r12, 0x00FF00
FILL r12
LDI r12, 0x0000FF
FILL r12
LDI r12, 0xFFFF00
FILL r12
HALT
