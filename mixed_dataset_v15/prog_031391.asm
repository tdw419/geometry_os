; DESCRIPTION: Draws a red rectangle at (252, 158) with width 39 and height 17.
; PLAN: r0=252(x), r1=158(y), r2=39(width), r3=17(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 252
LDI r1, 158
LDI r2, 39
LDI r3, 17
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
