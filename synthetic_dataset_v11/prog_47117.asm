; DESCRIPTION: Draws a magenta rectangle at (109, 135) with width 99 and height 65.
; PLAN: r0=109(x), r1=135(y), r2=99(width), r3=65(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 109
LDI r1, 135
LDI r2, 99
LDI r3, 65
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
