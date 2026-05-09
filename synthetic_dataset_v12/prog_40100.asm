; DESCRIPTION: Creates a yellow circular shape at (192, 183) with radius 13.
; PLAN: r0=192(x), r1=183(y), r2=13(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 192
LDI r1, 183
LDI r2, 13
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
