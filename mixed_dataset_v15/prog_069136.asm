; DESCRIPTION: Draws a magenta rectangle at (359, 184) with width 72 and height 23.
; PLAN: r0=359(x), r1=184(y), r2=72(width), r3=23(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 359
LDI r1, 184
LDI r2, 72
LDI r3, 23
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
