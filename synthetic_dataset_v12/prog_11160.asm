; DESCRIPTION: Creates a green circular shape at (112, 91) with radius 74.
; PLAN: r0=112(x), r1=91(y), r2=74(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 112
LDI r1, 91
LDI r2, 74
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
