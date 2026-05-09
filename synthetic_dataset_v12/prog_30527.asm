; DESCRIPTION: Creates a green circular shape at (100, 157) with radius 44.
; PLAN: r0=100(x), r1=157(y), r2=44(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 100
LDI r1, 157
LDI r2, 44
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
