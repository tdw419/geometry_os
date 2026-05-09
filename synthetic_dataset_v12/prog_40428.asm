; DESCRIPTION: Draws a magenta rectangle at (14, 60) with width 13 and height 115.
; PLAN: r0=14(x), r1=60(y), r2=13(width), r3=115(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 14
LDI r1, 60
LDI r2, 13
LDI r3, 115
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
