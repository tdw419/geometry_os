; DESCRIPTION: Creates a green circular shape at (359, 76) with radius 53.
; PLAN: r0=359(x), r1=76(y), r2=53(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 359
LDI r1, 76
LDI r2, 53
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
