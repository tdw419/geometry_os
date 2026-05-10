; DESCRIPTION: Draws a orange horizontal line across the screen at y=78.
; PLAN: r0=78(x1), r1=10(y1), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 78
LDI r1, 10
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
