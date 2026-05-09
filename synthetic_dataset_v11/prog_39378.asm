; DESCRIPTION: Draws a magenta rectangle at (63, 49) with width 66 and height 108.
; PLAN: r0=63(x), r1=49(y), r2=66(width), r3=108(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 63
LDI r1, 49
LDI r2, 66
LDI r3, 108
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
