; DESCRIPTION: Draws a green rectangle at (19, 124) with width 84 and height 97.
; PLAN: r0=19(x), r1=124(y), r2=84(width), r3=97(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 19
LDI r1, 124
LDI r2, 84
LDI r3, 97
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
