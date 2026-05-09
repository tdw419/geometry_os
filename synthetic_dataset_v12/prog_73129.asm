; DESCRIPTION: Draws a magenta rectangle at (141, 170) with width 115 and height 36.
; PLAN: r0=141(x), r1=170(y), r2=115(width), r3=36(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 141
LDI r1, 170
LDI r2, 115
LDI r3, 36
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
