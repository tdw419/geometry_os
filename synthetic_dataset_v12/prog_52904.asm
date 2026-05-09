; DESCRIPTION: Draws a white rectangle at (451, 119) with width 26 and height 11.
; PLAN: r0=451(x), r1=119(y), r2=26(width), r3=11(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 451
LDI r1, 119
LDI r2, 26
LDI r3, 11
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
