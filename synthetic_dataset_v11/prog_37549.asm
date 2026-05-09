; DESCRIPTION: Creates a green circular shape at (112, 15) with radius 15.
; PLAN: r0=112(x), r1=15(y), r2=15(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 112
LDI r1, 15
LDI r2, 15
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
