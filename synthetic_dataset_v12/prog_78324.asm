; DESCRIPTION: Draws a blue rectangle at (162, 96) with width 70 and height 118.
; PLAN: r0=162(x), r1=96(y), r2=70(width), r3=118(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 162
LDI r1, 96
LDI r2, 70
LDI r3, 118
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
