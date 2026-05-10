; DESCRIPTION: Creates a green circular shape at (457, 188) with radius 45.
; PLAN: r0=457(x), r1=188(y), r2=45(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 457
LDI r1, 188
LDI r2, 45
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
