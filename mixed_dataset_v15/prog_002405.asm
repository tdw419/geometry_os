; DESCRIPTION: Draws a blue rectangle at (208, 118) with width 78 and height 113.
; PLAN: r0=208(x), r1=118(y), r2=78(width), r3=113(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 208
LDI r1, 118
LDI r2, 78
LDI r3, 113
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
