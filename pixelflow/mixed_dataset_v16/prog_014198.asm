; DESCRIPTION: Draws a magenta rectangle at (318, 157) with width 85 and height 15.
; PLAN: r0=318(x), r1=157(y), r2=85(width), r3=15(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 318
LDI r1, 157
LDI r2, 85
LDI r3, 15
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
