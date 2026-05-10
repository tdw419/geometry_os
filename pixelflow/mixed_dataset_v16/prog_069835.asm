; DESCRIPTION: Draws a blue vertical line down the screen at x=51.
; PLAN: r0=51(x1), r1=1(y1), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 51
LDI r1, 1
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
