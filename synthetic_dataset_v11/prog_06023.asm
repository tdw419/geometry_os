; DESCRIPTION: Draws a magenta rectangle at (37, 26) with width 78 and height 115.
; PLAN: r0=37(x), r1=26(y), r2=78(width), r3=115(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 37
LDI r1, 26
LDI r2, 78
LDI r3, 115
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
