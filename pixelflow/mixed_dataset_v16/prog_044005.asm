; DESCRIPTION: Creates a green circular shape at (258, 161) with radius 80.
; PLAN: r0=258(x), r1=161(y), r2=80(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 258
LDI r1, 161
LDI r2, 80
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
