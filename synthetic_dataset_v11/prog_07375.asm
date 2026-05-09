; DESCRIPTION: Draws a magenta rectangle at (97, 211) with width 62 and height 20.
; PLAN: r0=97(x), r1=211(y), r2=62(width), r3=20(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 97
LDI r1, 211
LDI r2, 62
LDI r3, 20
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
