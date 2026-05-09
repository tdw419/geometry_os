; DESCRIPTION: Draws a yellow circle centered at (155, 199) with radius 49.
; PLAN: r0=155(x), r1=199(y), r2=49(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 155
LDI r1, 199
LDI r2, 49
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
