; DESCRIPTION: Draws a magenta rectangle at (83, 167) with width 84 and height 17.
; PLAN: r0=83(x), r1=167(y), r2=84(width), r3=17(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 83
LDI r1, 167
LDI r2, 84
LDI r3, 17
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
