; DESCRIPTION: Draws a green rectangle at (179, 2) with width 88 and height 49.
; PLAN: r0=179(x), r1=2(y), r2=88(width), r3=49(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 179
LDI r1, 2
LDI r2, 88
LDI r3, 49
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
