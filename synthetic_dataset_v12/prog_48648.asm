; DESCRIPTION: Draws a green circle centered at (144, 88) with radius 18.
; PLAN: r0=144(x), r1=88(y), r2=18(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 144
LDI r1, 88
LDI r2, 18
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
