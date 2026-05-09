; DESCRIPTION: Draws a magenta rectangle at (155, 157) with width 95 and height 83.
; PLAN: r0=155(x), r1=157(y), r2=95(width), r3=83(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 155
LDI r1, 157
LDI r2, 95
LDI r3, 83
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
