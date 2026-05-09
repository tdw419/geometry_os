; DESCRIPTION: Creates a black circular shape at (406, 100) with radius 30.
; PLAN: r0=406(x), r1=100(y), r2=30(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 406
LDI r1, 100
LDI r2, 30
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
