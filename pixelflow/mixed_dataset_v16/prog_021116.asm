; DESCRIPTION: Draws a magenta rectangle at (258, 158) with width 108 and height 93.
; PLAN: r0=258(x), r1=158(y), r2=108(width), r3=93(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 258
LDI r1, 158
LDI r2, 108
LDI r3, 93
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
