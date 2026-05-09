; DESCRIPTION: Draws a magenta rectangle at (28, 17) with width 62 and height 60.
; PLAN: r0=28(x), r1=17(y), r2=62(width), r3=60(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 28
LDI r1, 17
LDI r2, 62
LDI r3, 60
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
