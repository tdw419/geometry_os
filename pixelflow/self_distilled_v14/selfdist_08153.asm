; DESCRIPTION: Draws a magenta rectangle at (131, 132) with width 88 and height 89.
; PLAN: r0=131(x), r1=132(y), r2=88(width), r3=89(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 131
LDI r1, 132
LDI r2, 88
LDI r3, 89
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
