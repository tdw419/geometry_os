; DESCRIPTION: Renders a white box of size 114x41 starting at (62, 8).
; PLAN: r0=62(x), r1=8(y), r2=114(width), r3=41(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 62
LDI r1, 8
LDI r2, 114
LDI r3, 41
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
