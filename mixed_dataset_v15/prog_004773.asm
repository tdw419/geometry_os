; DESCRIPTION: Creates a green circular shape at (100, 110) with radius 38.
; PLAN: r0=100(x), r1=110(y), r2=38(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 100
LDI r1, 110
LDI r2, 38
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
