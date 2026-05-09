; DESCRIPTION: Draws a magenta rectangle at (5, 89) with width 111 and height 22.
; PLAN: r0=5(x), r1=89(y), r2=111(width), r3=22(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 5
LDI r1, 89
LDI r2, 111
LDI r3, 22
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
