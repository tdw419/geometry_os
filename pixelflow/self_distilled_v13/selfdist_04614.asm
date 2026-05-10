; DESCRIPTION: Draws a purple horizontal line across the screen at y=87.
; PLAN: r0=87(x1), r1=10(y1), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 87
LDI r1, 10
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
