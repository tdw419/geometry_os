; DESCRIPTION: Draws a purple horizontal line across the screen at y=117.
; PLAN: r0xAA00FF(color). Op: FILL r0.
LDI r0, 117
LDI r1, 117
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
