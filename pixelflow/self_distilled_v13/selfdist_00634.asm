; DESCRIPTION: Draws a white vertical line down the screen at x=45.
; PLAN: r0=45(x1), r1=1(y1), r2=0xFFFFFF(color). Op: FILL r0.
LDI r0, 45
LDI r1, 1
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
