; DESCRIPTION: Creates a green circular shape at (280, 179) with radius 13.
; PLAN: r0=280(x), r1=179(y), r2=13(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 280
LDI r1, 179
LDI r2, 13
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
