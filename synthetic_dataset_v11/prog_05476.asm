; DESCRIPTION: Draws a green rectangle at (14, 5) with width 78 and height 88.
; PLAN: r0=14(x), r1=5(y), r2=78(width), r3=88(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 14
LDI r1, 5
LDI r2, 78
LDI r3, 88
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
