; DESCRIPTION: Draws a green rectangle at (390, 86) with width 77 and height 118.
; PLAN: r0=390(x), r1=86(y), r2=77(width), r3=118(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 390
LDI r1, 86
LDI r2, 77
LDI r3, 118
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
