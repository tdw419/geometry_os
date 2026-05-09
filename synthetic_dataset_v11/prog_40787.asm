; DESCRIPTION: Draws a magenta rectangle at (209, 131) with width 22 and height 110.
; PLAN: r0=209(x), r1=131(y), r2=22(width), r3=110(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 209
LDI r1, 131
LDI r2, 22
LDI r3, 110
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
