; DESCRIPTION: Creates a green circular shape at (89, 91) with radius 41.
; PLAN: r0=89(x), r1=91(y), r2=41(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 89
LDI r1, 91
LDI r2, 41
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
