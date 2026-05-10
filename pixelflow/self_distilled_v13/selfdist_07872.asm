; DESCRIPTION: Draws a green horizontal line across the screen at y=87.
; PLAN: r0x1), r1=1(y1), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 87
LDI r1, 1
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
