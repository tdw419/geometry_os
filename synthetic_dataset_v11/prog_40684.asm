; DESCRIPTION: Draws a magenta rectangle at (179, 75) with width 62 and height 55.
; PLAN: r0=179(x), r1=75(y), r2=62(width), r3=55(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 179
LDI r1, 75
LDI r2, 62
LDI r3, 55
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
