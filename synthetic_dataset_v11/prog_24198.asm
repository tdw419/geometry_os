; DESCRIPTION: Draws a magenta rectangle at (62, 43) with width 85 and height 101.
; PLAN: r0=62(x), r1=43(y), r2=85(width), r3=101(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 62
LDI r1, 43
LDI r2, 85
LDI r3, 101
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
