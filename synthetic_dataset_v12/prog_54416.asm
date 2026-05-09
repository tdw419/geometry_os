; DESCRIPTION: Draws a magenta rectangle at (249, 13) with width 115 and height 100.
; PLAN: r0=249(x), r1=13(y), r2=115(width), r3=100(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 249
LDI r1, 13
LDI r2, 115
LDI r3, 100
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
