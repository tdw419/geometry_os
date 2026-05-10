; DESCRIPTION: Draws a white vertical line down the screen at x=110.
; PLAN: r0=110(x1), r1=1(y1), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 110
LDI r1, 1
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
