; DESCRIPTION: Draws a magenta rectangle at (323, 63) with width 55 and height 24.
; PLAN: r0=323(x), r1=63(y), r2=55(width), r3=24(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 323
LDI r1, 63
LDI r2, 55
LDI r3, 24
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
