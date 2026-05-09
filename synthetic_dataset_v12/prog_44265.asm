; DESCRIPTION: Draws a blue rectangle at (158, 5) with width 89 and height 68.
; PLAN: r0=158(x), r1=5(y), r2=89(width), r3=68(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 158
LDI r1, 5
LDI r2, 89
LDI r3, 68
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
