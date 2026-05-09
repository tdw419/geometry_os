; DESCRIPTION: Creates a green circular shape at (100, 119) with radius 37.
; PLAN: r0=100(x), r1=119(y), r2=37(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 100
LDI r1, 119
LDI r2, 37
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
