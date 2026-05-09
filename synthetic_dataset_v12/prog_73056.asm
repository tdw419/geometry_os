; DESCRIPTION: Renders a white box of size 45x87 starting at (24, 41).
; PLAN: r0=24(x), r1=41(y), r2=45(width), r3=87(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 24
LDI r1, 41
LDI r2, 45
LDI r3, 87
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
