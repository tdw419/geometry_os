; DESCRIPTION: Draws a orange horizontal line across the screen at y=53.
; PLAN: r0=53(x1), r1=53(y1), r2=0xFF8800(color). Op: FILL r0, r1, r2.
LDI r0, 53
LDI r1, 53
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
