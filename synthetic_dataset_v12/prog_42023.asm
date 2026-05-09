; DESCRIPTION: Draws a magenta rectangle at (395, 43) with width 58 and height 66.
; PLAN: r0=395(x), r1=43(y), r2=58(width), r3=66(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 395
LDI r1, 43
LDI r2, 58
LDI r3, 66
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
