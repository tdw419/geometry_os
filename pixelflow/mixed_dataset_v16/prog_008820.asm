; DESCRIPTION: Renders a green circular shape at (128, 89) with radius 76.
; PLAN: r0=128(x), r1=89(y), r2=76(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 128
LDI r1, 89
LDI r2, 76
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
