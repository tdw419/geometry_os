; DESCRIPTION: Draws a orange horizontal line across the screen at y=62.
; PLAN: r0=62(x1), r1=1(y1), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 62
LDI r1, 1
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
