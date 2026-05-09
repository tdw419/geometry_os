; DESCRIPTION: Creates a yellow circular shape at (291, 101) with radius 66.
; PLAN: r0=291(x), r1=101(y), r2=66(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 291
LDI r1, 101
LDI r2, 66
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
