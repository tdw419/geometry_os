; DESCRIPTION: Draws a magenta rectangle at (131, 106) with width 100 and height 22.
; PLAN: r0=131(x), r1=106(y), r2=100(width), r3=22(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 131
LDI r1, 106
LDI r2, 100
LDI r3, 22
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
