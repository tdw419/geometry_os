; DESCRIPTION: Draws a magenta horizontal line across the screen at y=193.
; PLAN: r0xFF00FF(color). Op: FILL r0.
LDI r0, 193
LDI r1, 19
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
