; DESCRIPTION: Draws a magenta rectangle at (132, 33) with width 99 and height 83.
; PLAN: r0=132(x), r1=33(y), r2=99(width), r3=83(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 132
LDI r1, 33
LDI r2, 99
LDI r3, 83
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
