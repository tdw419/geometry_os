; DESCRIPTION: Draws a magenta rectangle at (110, 123) with width 80 and height 48.
; PLAN: r0=110(x), r1=123(y), r2=80(width), r3=48(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 110
LDI r1, 123
LDI r2, 80
LDI r3, 48
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
