; DESCRIPTION: Render a red object at the screen.

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
