; DESCRIPTION: Display a object using color red at the screen.

; Colors -- fill screen with horizontal color bands
; Uses FILL in a loop to draw 4 color bands across the screen

LDI r5, 0xFF0000
FILL r5
LDI r5, 0x00FF00
FILL r5
LDI r5, 0x0000FF
FILL r5
LDI r5, 0xFFFF00
FILL r5
HALT
