; DESCRIPTION: Draws a magenta rectangle at (38, 123) with width 63 and height 96.
; PLAN: r0=38(x), r1=123(y), r2=63(width), r3=96(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 38
LDI r1, 123
LDI r2, 63
LDI r3, 96
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
