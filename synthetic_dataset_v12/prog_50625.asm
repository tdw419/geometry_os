; DESCRIPTION: Creates a green circular shape at (261, 108) with radius 14.
; PLAN: r0=261(x), r1=108(y), r2=14(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 261
LDI r1, 108
LDI r2, 14
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
