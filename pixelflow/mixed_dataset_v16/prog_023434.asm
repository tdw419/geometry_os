; DESCRIPTION: Draws a magenta rectangle at (236, 155) with width 53 and height 13.
; PLAN: r0=236(x), r1=155(y), r2=53(width), r3=13(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 236
LDI r1, 155
LDI r2, 53
LDI r3, 13
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
