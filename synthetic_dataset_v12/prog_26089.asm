; DESCRIPTION: Draws a blue circle centered at (430, 81) with radius 49.
; PLAN: r0=430(x), r1=81(y), r2=49(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 430
LDI r1, 81
LDI r2, 49
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
