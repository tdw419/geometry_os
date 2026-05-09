; DESCRIPTION: Creates a yellow circular shape at (123, 211) with radius 33.
; PLAN: r0=123(x), r1=211(y), r2=33(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 123
LDI r1, 211
LDI r2, 33
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
