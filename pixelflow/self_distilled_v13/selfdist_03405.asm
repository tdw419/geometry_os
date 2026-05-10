; DESCRIPTION: Draws a purple horizontal line across the screen at y=152.
; PLAN: r0xAA00FF(color). Op: FILL r0.
LDI r0, 152
LDI r1, 0xAA00FF
PSET r0, r1, r2
HALT
