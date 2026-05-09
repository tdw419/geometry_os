; DESCRIPTION: Draws a magenta rectangle at (201, 102) with width 80 and height 81.
; PLAN: r0=201(x), r1=102(y), r2=80(width), r3=81(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 201
LDI r1, 102
LDI r2, 80
LDI r3, 81
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
