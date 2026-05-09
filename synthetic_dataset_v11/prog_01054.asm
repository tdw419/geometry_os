; DESCRIPTION: Draws a black rectangle at (55, 97) with width 10 and height 94.
; PLAN: r0=55(x), r1=97(y), r2=10(width), r3=94(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 55
LDI r1, 97
LDI r2, 10
LDI r3, 94
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
