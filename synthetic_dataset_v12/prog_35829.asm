; DESCRIPTION: Creates a yellow circular shape at (76, 123) with radius 76.
; PLAN: r0=76(x), r1=123(y), r2=76(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 76
LDI r1, 123
LDI r2, 76
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
