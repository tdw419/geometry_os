; DESCRIPTION: Draws a blue rectangle at (7, 97) with width 72 and height 110.
; PLAN: r0=7(x), r1=97(y), r2=72(width), r3=110(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 7
LDI r1, 97
LDI r2, 72
LDI r3, 110
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
