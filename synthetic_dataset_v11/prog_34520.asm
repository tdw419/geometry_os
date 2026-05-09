; DESCRIPTION: Creates a white circular shape at (126, 50) with radius 41.
; PLAN: r0=126(x), r1=50(y), r2=41(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 126
LDI r1, 50
LDI r2, 41
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
