; DESCRIPTION: Draws a magenta rectangle at (311, 198) with width 44 and height 40.
; PLAN: r0=311(x), r1=198(y), r2=44(width), r3=40(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 311
LDI r1, 198
LDI r2, 44
LDI r3, 40
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
