; DESCRIPTION: Creates a blue diamond shape using 4 lines meeting at the center.
; PLAN: r0=41(x), r1=4(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 41
LDI r1, 4
LDI r2, 0
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
