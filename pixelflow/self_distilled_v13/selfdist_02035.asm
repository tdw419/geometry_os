; DESCRIPTION: Draws a blue vertical line down the screen at x=59.
; PLAN: r0=59(x1), r1=1(y1), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 59
LDI r1, 1
LDI r2, 0
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
