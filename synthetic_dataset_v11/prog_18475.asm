; DESCRIPTION: Creates a green circular shape at (89, 143) with radius 80.
; PLAN: r0=89(x), r1=143(y), r2=80(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 89
LDI r1, 143
LDI r2, 80
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
