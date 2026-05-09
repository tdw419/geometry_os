; DESCRIPTION: Draws a magenta rectangle at (14, 156) with width 101 and height 67.
; PLAN: r0=14(x), r1=156(y), r2=101(width), r3=67(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 14
LDI r1, 156
LDI r2, 101
LDI r3, 67
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
