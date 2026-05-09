; DESCRIPTION: Draws a magenta rectangle at (364, 89) with width 108 and height 100.
; PLAN: r0=364(x), r1=89(y), r2=108(width), r3=100(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 364
LDI r1, 89
LDI r2, 108
LDI r3, 100
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
