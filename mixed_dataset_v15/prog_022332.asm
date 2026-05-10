; DESCRIPTION: Draws a white rectangle at (95, 119) with width 41 and height 22.
; PLAN: r0=95(x), r1=119(y), r2=41(width), r3=22(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 95
LDI r1, 119
LDI r2, 41
LDI r3, 22
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
