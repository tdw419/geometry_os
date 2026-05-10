; DESCRIPTION: Draws a red rectangle at (183, 41) with width 43 and height 114.
; PLAN: r0=183(x), r1=41(y), r2=43(width), r3=114(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 183
LDI r1, 41
LDI r2, 43
LDI r3, 114
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
