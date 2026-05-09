; DESCRIPTION: Creates a green circular shape at (64, 154) with radius 23.
; PLAN: r0=64(x), r1=154(y), r2=23(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 64
LDI r1, 154
LDI r2, 23
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
