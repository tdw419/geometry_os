; DESCRIPTION: Draws a magenta rectangle at (108, 172) with width 101 and height 17.
; PLAN: r0=108(x), r1=172(y), r2=101(width), r3=17(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 108
LDI r1, 172
LDI r2, 101
LDI r3, 17
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
