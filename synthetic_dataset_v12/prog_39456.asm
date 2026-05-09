; DESCRIPTION: Draws a magenta rectangle at (451, 11) with width 19 and height 61.
; PLAN: r0=451(x), r1=11(y), r2=19(width), r3=61(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 451
LDI r1, 11
LDI r2, 19
LDI r3, 61
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
