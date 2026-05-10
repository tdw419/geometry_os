; DESCRIPTION: Draws a blue rectangle at (133, 9) with width 37 and height 118.
; PLAN: r0=133(x), r1=9(y), r2=37(width), r3=118(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 133
LDI r1, 9
LDI r2, 37
LDI r3, 118
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
