; DESCRIPTION: Renders a white box of size 41x37 starting at (308, 53).
; PLAN: r0=308(x), r1=53(y), r2=41(width), r3=37(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 308
LDI r1, 53
LDI r2, 41
LDI r3, 37
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
