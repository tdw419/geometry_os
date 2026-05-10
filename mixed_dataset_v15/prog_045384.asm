; DESCRIPTION: Renders a white box of size 70x72 starting at (155, 41).
; PLAN: r0=155(x), r1=41(y), r2=70(width), r3=72(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 155
LDI r1, 41
LDI r2, 70
LDI r3, 72
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
