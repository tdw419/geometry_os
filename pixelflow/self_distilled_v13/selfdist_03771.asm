; DESCRIPTION: Draws a purple horizontal line across the screen at y=57.
; PLAN: r0=57(x1), r1=0(y1), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 57
LDI r1, 0
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
