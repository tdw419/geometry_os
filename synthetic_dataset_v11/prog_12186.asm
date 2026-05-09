; DESCRIPTION: Draws a white rectangle at (158, 217) with width 41 and height 39.
; PLAN: r0=158(x), r1=217(y), r2=41(width), r3=39(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 158
LDI r1, 217
LDI r2, 41
LDI r3, 39
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
