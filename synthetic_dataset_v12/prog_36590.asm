; DESCRIPTION: Creates a green circular shape at (397, 110) with radius 60.
; PLAN: r0=397(x), r1=110(y), r2=60(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 397
LDI r1, 110
LDI r2, 60
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
