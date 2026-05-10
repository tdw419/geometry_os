; DESCRIPTION: Draws a blue vertical line down the screen at x=73.
; PLAN: r0x1), r1=11(y1), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 73
LDI r1, 11
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
