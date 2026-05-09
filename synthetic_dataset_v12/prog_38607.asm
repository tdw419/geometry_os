; DESCRIPTION: Draws a black rectangle at (62, 138) with width 88 and height 117.
; PLAN: r0=62(x), r1=138(y), r2=88(width), r3=117(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 62
LDI r1, 138
LDI r2, 88
LDI r3, 117
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
