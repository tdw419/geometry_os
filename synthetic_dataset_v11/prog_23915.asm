; DESCRIPTION: Draws a green rectangle at (132, 119) with width 114 and height 57.
; PLAN: r0=132(x), r1=119(y), r2=114(width), r3=57(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 132
LDI r1, 119
LDI r2, 114
LDI r3, 57
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
