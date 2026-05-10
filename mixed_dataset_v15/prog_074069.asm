; DESCRIPTION: Draws a magenta horizontal line across the screen at y=134.
; PLAN: r0xFF00FF(color). Op: FILL r0.
LDI r0, 134
LDI r1, 0xFF00FF
FILL r0
HALT
