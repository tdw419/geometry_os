; DESCRIPTION: Draws a magenta rectangle at (163, 62) with width 68 and height 116.
; PLAN: r0=163(x), r1=62(y), r2=68(width), r3=116(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 163
LDI r1, 62
LDI r2, 68
LDI r3, 116
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
