; DESCRIPTION: Draws a purple vertical line down the screen at x=152.
; PLAN: r0(x1), r1=21(y1), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 152
LDI r1, 21
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
