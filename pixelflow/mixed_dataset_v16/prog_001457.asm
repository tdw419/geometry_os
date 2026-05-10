; DESCRIPTION: Draws a magenta horizontal line across the screen at y=15.
; PLAN: r0xFF00FF(color). Op: FILL r0.
LDI r0, 15
LDI r1, 0xFF0000FF
FILL r0
HALT
