; DESCRIPTION: Draws a magenta rectangle at (212, 139) with width 87 and height 66.
; PLAN: r0=212(x), r1=139(y), r2=87(width), r3=66(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 212
LDI r1, 139
LDI r2, 87
LDI r3, 66
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
