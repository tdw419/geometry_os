; DESCRIPTION: Creates a yellow circular shape at (26, 167) with radius 13.
; PLAN: r0=26(x), r1=167(y), r2=13(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 26
LDI r1, 167
LDI r2, 13
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
