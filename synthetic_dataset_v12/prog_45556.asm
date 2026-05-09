; DESCRIPTION: Creates a green circular shape at (23, 160) with radius 13.
; PLAN: r0=23(x), r1=160(y), r2=13(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 23
LDI r1, 160
LDI r2, 13
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
