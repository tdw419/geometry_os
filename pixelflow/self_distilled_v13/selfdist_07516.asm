; DESCRIPTION: Draws a purple vertical line down the screen at x=262.
; PLAN: r0x1), r1=1(y1), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 0xAA00FF
FILL r0
HALT
