; DESCRIPTION: Draws a magenta rectangle at (82, 212) with width 22 and height 29.
; PLAN: r0=82(x), r1=212(y), r2=22(width), r3=29(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 82
LDI r1, 212
LDI r2, 22
LDI r3, 29
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
