; DESCRIPTION: Draws a magenta rectangle at (4, 161) with width 56 and height 88.
; PLAN: r0=4(x), r1=161(y), r2=56(width), r3=88(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 4
LDI r1, 161
LDI r2, 56
LDI r3, 88
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
