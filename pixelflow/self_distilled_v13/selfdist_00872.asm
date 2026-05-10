; DESCRIPTION: Draws a orange horizontal line across the screen at y=66.
; PLAN: r0=66(x1), r1=1(y1), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 66
LDI r1, 1
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
