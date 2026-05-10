; DESCRIPTION: Draws a magenta rectangle at (188, 118) with width 37 and height 41.
; PLAN: r0=188(x), r1=118(y), r2=37(width), r3=41(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 188
LDI r1, 118
LDI r2, 37
LDI r3, 41
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
