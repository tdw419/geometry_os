; DESCRIPTION: Draws a purple horizontal line across the screen at y=77.
; PLAN: r0=77(x1), r1=1(y1), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 77
LDI r1, 1
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
