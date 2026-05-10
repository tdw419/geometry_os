; DESCRIPTION: Draws a purple horizontal line across the screen at y=1.
; PLAN: r0xAA00FF(color). Op: FILL r0.
LDI r0, 1
LDI r1, 1
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
