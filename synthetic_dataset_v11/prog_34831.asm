; DESCRIPTION: Draws a red rectangle at (54, 162) with width 75 and height 88.
; PLAN: r0=54(x), r1=162(y), r2=75(width), r3=88(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 54
LDI r1, 162
LDI r2, 75
LDI r3, 88
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
