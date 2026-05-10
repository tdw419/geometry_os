; DESCRIPTION: Draws a green rectangle at (287, 162) with width 88 and height 93.
; PLAN: r0=287(x), r1=162(y), r2=88(width), r3=93(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 287
LDI r1, 162
LDI r2, 88
LDI r3, 93
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
