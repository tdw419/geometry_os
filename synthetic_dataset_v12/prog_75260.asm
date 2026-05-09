; DESCRIPTION: Creates a green circular shape at (72, 176) with radius 64.
; PLAN: r0=72(x), r1=176(y), r2=64(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 72
LDI r1, 176
LDI r2, 64
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
