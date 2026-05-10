; DESCRIPTION: Draws a magenta horizontal line across the screen at y=132.
; PLAN: r0xFF00FF(color). Op: FILL r0.
LDI r0, 132
LDI r1, 0xFF00FF
FILL r0
HALT
