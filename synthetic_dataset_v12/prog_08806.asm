; DESCRIPTION: Creates a white circular shape at (333, 96) with radius 41.
; PLAN: r0=333(x), r1=96(y), r2=41(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 333
LDI r1, 96
LDI r2, 41
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
