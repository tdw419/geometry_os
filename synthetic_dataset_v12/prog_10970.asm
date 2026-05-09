; DESCRIPTION: Creates a yellow circular shape at (339, 148) with radius 73.
; PLAN: r0=339(x), r1=148(y), r2=73(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 339
LDI r1, 148
LDI r2, 73
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
