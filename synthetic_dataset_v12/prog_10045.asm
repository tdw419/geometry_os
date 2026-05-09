; DESCRIPTION: Draws a magenta rectangle at (264, 100) with width 56 and height 94.
; PLAN: r0=264(x), r1=100(y), r2=56(width), r3=94(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 264
LDI r1, 100
LDI r2, 56
LDI r3, 94
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
