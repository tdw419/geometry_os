; DESCRIPTION: Draws a purple horizontal line across the screen at y=191.
; PLAN: r0xAA00FF(color). Op: FILL r0.
LDI r0, 191
LDI r1, 19
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
