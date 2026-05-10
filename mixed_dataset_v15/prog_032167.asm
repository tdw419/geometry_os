; DESCRIPTION: Draws a magenta rectangle at (187, 101) with width 110 and height 118.
; PLAN: r0=187(x), r1=101(y), r2=110(width), r3=118(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 187
LDI r1, 101
LDI r2, 110
LDI r3, 118
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
