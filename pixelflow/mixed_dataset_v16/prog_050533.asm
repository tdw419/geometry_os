; DESCRIPTION: Draws a magenta horizontal line across the screen at y=148.
; PLAN: r0xFF00FF(color). Op: FILL r0.
LDI r0, 148
LDI r1, 0xFF00FF
FILL r0
HALT
