; DESCRIPTION: Draws a magenta rectangle at (62, 71) with width 19 and height 119.
; PLAN: r0=62(x), r1=71(y), r2=19(width), r3=119(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 62
LDI r1, 71
LDI r2, 19
LDI r3, 119
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
