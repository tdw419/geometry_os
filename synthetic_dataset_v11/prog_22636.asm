; DESCRIPTION: Draws a blue rectangle at (39, 57) with width 110 and height 97.
; PLAN: r0=39(x), r1=57(y), r2=110(width), r3=97(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 39
LDI r1, 57
LDI r2, 110
LDI r3, 97
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
