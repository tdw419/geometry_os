; DESCRIPTION: Draws a blue circle centered at (292, 112) with radius 49.
; PLAN: r0=292(x), r1=112(y), r2=49(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 292
LDI r1, 112
LDI r2, 49
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
