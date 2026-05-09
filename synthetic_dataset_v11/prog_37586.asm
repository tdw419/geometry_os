; DESCRIPTION: Creates a white circular shape at (46, 114) with radius 41.
; PLAN: r0=46(x), r1=114(y), r2=41(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 46
LDI r1, 114
LDI r2, 41
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
