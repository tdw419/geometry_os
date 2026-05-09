; DESCRIPTION: Draws a magenta rectangle at (135, 52) with width 62 and height 112.
; PLAN: r0=135(x), r1=52(y), r2=62(width), r3=112(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 135
LDI r1, 52
LDI r2, 62
LDI r3, 112
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
