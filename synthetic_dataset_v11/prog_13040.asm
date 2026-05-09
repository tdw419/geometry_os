; DESCRIPTION: Draws a yellow rectangle at (94, 84) with width 97 and height 25.
; PLAN: r0=94(x), r1=84(y), r2=97(width), r3=25(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 94
LDI r1, 84
LDI r2, 97
LDI r3, 25
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
