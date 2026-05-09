; DESCRIPTION: Draws a magenta rectangle at (248, 181) with width 118 and height 13.
; PLAN: r0=248(x), r1=181(y), r2=118(width), r3=13(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 248
LDI r1, 181
LDI r2, 118
LDI r3, 13
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
