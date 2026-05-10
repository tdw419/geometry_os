; DESCRIPTION: Draws a magenta horizontal line across the screen at y=14.
; PLAN: r0xFF00FF(color). Op: FILL r0.
LDI r0, 14
LDI r1, 0xFF0000FF
FILL r0
HALT
