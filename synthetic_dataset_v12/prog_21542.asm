; DESCRIPTION: Draws a magenta rectangle at (178, 89) with width 25 and height 62.
; PLAN: r0=178(x), r1=89(y), r2=25(width), r3=62(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 178
LDI r1, 89
LDI r2, 25
LDI r3, 62
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
