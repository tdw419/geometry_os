; DESCRIPTION: Draws a black rectangle at (97, 148) with width 68 and height 78.
; PLAN: r0=97(x), r1=148(y), r2=68(width), r3=78(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 97
LDI r1, 148
LDI r2, 68
LDI r3, 78
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
