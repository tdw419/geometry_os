; DESCRIPTION: Draws a magenta rectangle at (178, 56) with width 112 and height 106.
; PLAN: r0=178(x), r1=56(y), r2=112(width), r3=106(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 178
LDI r1, 56
LDI r2, 112
LDI r3, 106
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
