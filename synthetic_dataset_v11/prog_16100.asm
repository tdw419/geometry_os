; DESCRIPTION: Draws a magenta rectangle at (80, 94) with width 100 and height 84.
; PLAN: r0=80(x), r1=94(y), r2=100(width), r3=84(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 80
LDI r1, 94
LDI r2, 100
LDI r3, 84
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
