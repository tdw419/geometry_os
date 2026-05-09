; DESCRIPTION: Creates a yellow circular shape at (88, 175) with radius 64.
; PLAN: r0=88(x), r1=175(y), r2=64(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 88
LDI r1, 175
LDI r2, 64
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
