; DESCRIPTION: Draws a blue rectangle at (344, 118) with width 118 and height 77.
; PLAN: r0=344(x), r1=118(y), r2=118(width), r3=77(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 344
LDI r1, 118
LDI r2, 118
LDI r3, 77
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
