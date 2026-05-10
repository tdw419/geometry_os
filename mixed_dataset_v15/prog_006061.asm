; DESCRIPTION: Draws a green vertical line down the screen at x=60.
; PLAN: r0=60(x1), r1=1(y1), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 60
LDI r1, 1
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
