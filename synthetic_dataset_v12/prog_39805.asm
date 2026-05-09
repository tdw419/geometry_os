; DESCRIPTION: Draws a green circle centered at (61, 88) with radius 15.
; PLAN: r0=61(x), r1=88(y), r2=15(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 61
LDI r1, 88
LDI r2, 15
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
