; DESCRIPTION: Draws a magenta rectangle at (94, 43) with width 33 and height 56.
; PLAN: r0=94(x), r1=43(y), r2=33(width), r3=56(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 94
LDI r1, 43
LDI r2, 33
LDI r3, 56
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
