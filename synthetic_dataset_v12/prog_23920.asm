; DESCRIPTION: Creates a green circular shape at (24, 87) with radius 16.
; PLAN: r0=24(x), r1=87(y), r2=16(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 24
LDI r1, 87
LDI r2, 16
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
