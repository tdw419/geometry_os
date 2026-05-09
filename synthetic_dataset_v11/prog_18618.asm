; DESCRIPTION: Draws a magenta rectangle at (119, 72) with width 24 and height 63.
; PLAN: r0=119(x), r1=72(y), r2=24(width), r3=63(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 119
LDI r1, 72
LDI r2, 24
LDI r3, 63
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
