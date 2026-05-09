; DESCRIPTION: Creates a yellow circular shape at (137, 88) with radius 73.
; PLAN: r0=137(x), r1=88(y), r2=73(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 137
LDI r1, 88
LDI r2, 73
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
