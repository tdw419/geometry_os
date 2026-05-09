; DESCRIPTION: Creates a green circular shape at (117, 157) with radius 33.
; PLAN: r0=117(x), r1=157(y), r2=33(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 117
LDI r1, 157
LDI r2, 33
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
