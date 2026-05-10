; DESCRIPTION: Draws a orange horizontal line across the screen at y=97.
; PLAN: r0=97(x1), r1=1(y1), r2=0xFF8800(color). Op: FILL r0, r1, r2.
LDI r0, 97
LDI r1, 1
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
