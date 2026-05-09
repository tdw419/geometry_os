; DESCRIPTION: Draws a black rectangle at (3, 91) with width 97 and height 11.
; PLAN: r0=3(x), r1=91(y), r2=97(width), r3=11(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 3
LDI r1, 91
LDI r2, 97
LDI r3, 11
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
