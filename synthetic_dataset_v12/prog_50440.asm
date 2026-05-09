; DESCRIPTION: Creates a white circular shape at (368, 186) with radius 41.
; PLAN: r0=368(x), r1=186(y), r2=41(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 368
LDI r1, 186
LDI r2, 41
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
