; DESCRIPTION: Creates a green circular shape at (210, 162) with radius 41.
; PLAN: r0=210(x), r1=162(y), r2=41(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 210
LDI r1, 162
LDI r2, 41
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
