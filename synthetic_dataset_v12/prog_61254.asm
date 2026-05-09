; DESCRIPTION: Draws a magenta rectangle at (260, 155) with width 64 and height 78.
; PLAN: r0=260(x), r1=155(y), r2=64(width), r3=78(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 260
LDI r1, 155
LDI r2, 64
LDI r3, 78
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
