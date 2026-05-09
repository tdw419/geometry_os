; DESCRIPTION: Draws a magenta rectangle at (83, 156) with width 94 and height 72.
; PLAN: r0=83(x), r1=156(y), r2=94(width), r3=72(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 83
LDI r1, 156
LDI r2, 94
LDI r3, 72
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
