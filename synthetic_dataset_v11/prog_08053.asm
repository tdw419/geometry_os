; DESCRIPTION: Draws a magenta rectangle at (96, 54) with width 88 and height 117.
; PLAN: r0=96(x), r1=54(y), r2=88(width), r3=117(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 96
LDI r1, 54
LDI r2, 88
LDI r3, 117
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
