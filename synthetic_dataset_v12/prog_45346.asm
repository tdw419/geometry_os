; DESCRIPTION: Creates a black circular shape at (437, 41) with radius 16.
; PLAN: r0=437(x), r1=41(y), r2=16(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 437
LDI r1, 41
LDI r2, 16
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
