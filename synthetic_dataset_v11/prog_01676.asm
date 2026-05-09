; DESCRIPTION: Draws a magenta rectangle at (11, 49) with width 85 and height 90.
; PLAN: r0=11(x), r1=49(y), r2=85(width), r3=90(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 11
LDI r1, 49
LDI r2, 85
LDI r3, 90
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
