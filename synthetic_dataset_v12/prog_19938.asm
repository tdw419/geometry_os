; DESCRIPTION: Draws a magenta rectangle at (140, 99) with width 20 and height 47.
; PLAN: r0=140(x), r1=99(y), r2=20(width), r3=47(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 140
LDI r1, 99
LDI r2, 20
LDI r3, 47
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
