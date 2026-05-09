; DESCRIPTION: Creates a green circular shape at (41, 135) with radius 15.
; PLAN: r0=41(x), r1=135(y), r2=15(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 41
LDI r1, 135
LDI r2, 15
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
