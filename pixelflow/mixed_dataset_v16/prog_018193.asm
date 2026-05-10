; DESCRIPTION: Draws a magenta rectangle at (283, 199) with width 15 and height 63.
; PLAN: r0=283(x), r1=199(y), r2=15(width), r3=63(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 283
LDI r1, 199
LDI r2, 15
LDI r3, 63
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
