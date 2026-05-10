; DESCRIPTION: Draws a magenta horizontal line across the screen at y=175.
; PLAN: r0xFF00FF(color). Op: FILL r0.
LDI r0, 175
LDI r1, 0xFF00FF
FILL r0
HALT
