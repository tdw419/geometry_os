; DESCRIPTION: Draws a black rectangle at (155, 117) with width 56 and height 115.
; PLAN: r0=155(x), r1=117(y), r2=56(width), r3=115(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 155
LDI r1, 117
LDI r2, 56
LDI r3, 115
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
