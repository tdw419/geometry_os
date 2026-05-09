; DESCRIPTION: Draws a magenta rectangle at (14, 63) with width 55 and height 31.
; PLAN: r0=14(x), r1=63(y), r2=55(width), r3=31(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 14
LDI r1, 63
LDI r2, 55
LDI r3, 31
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
