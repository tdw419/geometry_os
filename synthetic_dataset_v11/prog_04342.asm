; DESCRIPTION: Draws a magenta rectangle at (181, 34) with width 68 and height 56.
; PLAN: r0=181(x), r1=34(y), r2=68(width), r3=56(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 181
LDI r1, 34
LDI r2, 68
LDI r3, 56
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
