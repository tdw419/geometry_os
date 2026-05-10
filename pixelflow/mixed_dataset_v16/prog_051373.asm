; DESCRIPTION: Draws a magenta rectangle at (252, 181) with width 36 and height 57.
; PLAN: r0=252(x), r1=181(y), r2=36(width), r3=57(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 252
LDI r1, 181
LDI r2, 36
LDI r3, 57
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
