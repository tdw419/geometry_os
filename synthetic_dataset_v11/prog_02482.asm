; DESCRIPTION: Draws a green rectangle at (43, 116) with width 60 and height 88.
; PLAN: r0=43(x), r1=116(y), r2=60(width), r3=88(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 43
LDI r1, 116
LDI r2, 60
LDI r3, 88
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
