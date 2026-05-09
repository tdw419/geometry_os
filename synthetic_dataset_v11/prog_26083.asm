; DESCRIPTION: Draws a magenta rectangle at (161, 43) with width 69 and height 114.
; PLAN: r0=161(x), r1=43(y), r2=69(width), r3=114(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 161
LDI r1, 43
LDI r2, 69
LDI r3, 114
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
