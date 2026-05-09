; DESCRIPTION: Creates a green circular shape at (89, 132) with radius 39.
; PLAN: r0=89(x), r1=132(y), r2=39(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 89
LDI r1, 132
LDI r2, 39
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
