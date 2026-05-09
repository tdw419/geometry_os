; DESCRIPTION: Renders a white box of size 101x81 starting at (62, 41).
; PLAN: r0=62(x), r1=41(y), r2=101(width), r3=81(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 62
LDI r1, 41
LDI r2, 101
LDI r3, 81
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
