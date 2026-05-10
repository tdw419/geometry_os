; DESCRIPTION: Draws a magenta rectangle at (137, 175) with width 78 and height 18.
; PLAN: r0=137(x), r1=175(y), r2=78(width), r3=18(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 137
LDI r1, 175
LDI r2, 78
LDI r3, 18
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
