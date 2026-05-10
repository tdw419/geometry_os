; DESCRIPTION: Creates a green circular shape at (244, 117) with radius 58.
; PLAN: r0=244(x), r1=117(y), r2=58(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 244
LDI r1, 117
LDI r2, 58
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
