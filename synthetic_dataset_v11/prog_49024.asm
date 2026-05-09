; DESCRIPTION: Draws a red rectangle at (54, 123) with width 81 and height 22.
; PLAN: r0=54(x), r1=123(y), r2=81(width), r3=22(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 54
LDI r1, 123
LDI r2, 81
LDI r3, 22
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
