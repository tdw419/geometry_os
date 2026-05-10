; DESCRIPTION: Draws a magenta rectangle at (311, 15) with width 60 and height 96.
; PLAN: r0=311(x), r1=15(y), r2=60(width), r3=96(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 311
LDI r1, 15
LDI r2, 60
LDI r3, 96
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
