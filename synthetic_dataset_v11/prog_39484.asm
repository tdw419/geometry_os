; DESCRIPTION: Draws a black rectangle at (12, 158) with width 34 and height 62.
; PLAN: r0=12(x), r1=158(y), r2=34(width), r3=62(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 12
LDI r1, 158
LDI r2, 34
LDI r3, 62
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
