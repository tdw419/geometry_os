; DESCRIPTION: Draws a blue vertical line down the screen at x=58.
; PLAN: r0=58(x1), r1=10(y1), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 58
LDI r1, 10
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
