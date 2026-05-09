; DESCRIPTION: Places a black circle of radius 41 at center (119, 121).
; PLAN: r0=119(x), r1=121(y), r2=41(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 119
LDI r1, 121
LDI r2, 41
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
