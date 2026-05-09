; DESCRIPTION: Draws a magenta rectangle at (351, 89) with width 113 and height 108.
; PLAN: r0=351(x), r1=89(y), r2=113(width), r3=108(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 351
LDI r1, 89
LDI r2, 113
LDI r3, 108
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
