; DESCRIPTION: Draws a blue rectangle at (175, 9) with width 118 and height 31.
; PLAN: r0=175(x), r1=9(y), r2=118(width), r3=31(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 175
LDI r1, 9
LDI r2, 118
LDI r3, 31
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
