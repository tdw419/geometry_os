; DESCRIPTION: Draws a blue vertical line down the screen at x=17.
; PLAN: r0=17(x1), r1=17(y1), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 17
LDI r1, 17
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
