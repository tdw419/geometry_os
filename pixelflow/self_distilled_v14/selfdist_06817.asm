; DESCRIPTION: Draws a blue vertical line down the screen at x=93.
; PLAN: r0=93(x1), r1=93(y1), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 93
LDI r1, 93
LDI r2, 0
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
