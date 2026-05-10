; DESCRIPTION: Draws a purple horizontal line across the screen at y=4.
; PLAN: r0=4(x1), r1=1(y1), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 4
LDI r1, 1
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
