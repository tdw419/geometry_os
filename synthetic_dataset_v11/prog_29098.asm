; DESCRIPTION: Draws a white rectangle at (118, 97) with width 65 and height 41.
; PLAN: r0=118(x), r1=97(y), r2=65(width), r3=41(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 118
LDI r1, 97
LDI r2, 65
LDI r3, 41
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
