; DESCRIPTION: Creates a green circular shape at (431, 232) with radius 10.
; PLAN: r0=431(x), r1=232(y), r2=10(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 431
LDI r1, 232
LDI r2, 10
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
