; DESCRIPTION: Draws a green circle centered at (414, 88) with radius 66.
; PLAN: r0=414(x), r1=88(y), r2=66(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 414
LDI r1, 88
LDI r2, 66
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
