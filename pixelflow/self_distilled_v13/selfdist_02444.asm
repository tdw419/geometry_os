; DESCRIPTION: Draws a orange horizontal line across the screen at y=110.
; PLAN: r0=110(x1), r1=11(y1), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 110
LDI r1, 11
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
