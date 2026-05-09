; DESCRIPTION: Draws a magenta rectangle at (252, 99) with width 54 and height 117.
; PLAN: r0=252(x), r1=99(y), r2=54(width), r3=117(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 252
LDI r1, 99
LDI r2, 54
LDI r3, 117
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
