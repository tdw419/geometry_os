; DESCRIPTION: Draws a magenta rectangle at (390, 118) with width 53 and height 93.
; PLAN: r0=390(x), r1=118(y), r2=53(width), r3=93(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 390
LDI r1, 118
LDI r2, 53
LDI r3, 93
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
