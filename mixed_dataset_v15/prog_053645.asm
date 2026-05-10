; DESCRIPTION: Draws a green rectangle at (169, 49) with width 36 and height 96.
; PLAN: r0=169(x), r1=49(y), r2=36(width), r3=96(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 169
LDI r1, 49
LDI r2, 36
LDI r3, 96
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
