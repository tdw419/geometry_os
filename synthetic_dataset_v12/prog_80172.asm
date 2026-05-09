; DESCRIPTION: Creates a green circular shape at (128, 172) with radius 14.
; PLAN: r0=128(x), r1=172(y), r2=14(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 128
LDI r1, 172
LDI r2, 14
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
