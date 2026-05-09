; DESCRIPTION: Creates a green circular shape at (89, 89) with radius 28.
; PLAN: r0=89(x), r1=89(y), r2=28(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 89
LDI r1, 89
LDI r2, 28
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
