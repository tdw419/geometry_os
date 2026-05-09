; DESCRIPTION: Draws a blue rectangle at (74, 159) with width 118 and height 84.
; PLAN: r0=74(x), r1=159(y), r2=118(width), r3=84(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 74
LDI r1, 159
LDI r2, 118
LDI r3, 84
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
