; DESCRIPTION: Creates a blue circular shape at (101, 41) with radius 35.
; PLAN: r0=101(x), r1=41(y), r2=35(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 101
LDI r1, 41
LDI r2, 35
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
