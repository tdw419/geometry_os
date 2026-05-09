; DESCRIPTION: Draws a magenta rectangle at (2, 86) with width 34 and height 88.
; PLAN: r0=2(x), r1=86(y), r2=34(width), r3=88(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 2
LDI r1, 86
LDI r2, 34
LDI r3, 88
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
