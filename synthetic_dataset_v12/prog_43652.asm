; DESCRIPTION: Draws a magenta rectangle at (241, 63) with width 100 and height 80.
; PLAN: r0=241(x), r1=63(y), r2=100(width), r3=80(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 241
LDI r1, 63
LDI r2, 100
LDI r3, 80
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
