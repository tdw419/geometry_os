; DESCRIPTION: Draws a magenta rectangle at (227, 26) with width 86 and height 116.
; PLAN: r0=227(x), r1=26(y), r2=86(width), r3=116(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 227
LDI r1, 26
LDI r2, 86
LDI r3, 116
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
