; DESCRIPTION: Draws a black rectangle at (114, 24) with width 20 and height 97.
; PLAN: r0=114(x), r1=24(y), r2=20(width), r3=97(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 114
LDI r1, 24
LDI r2, 20
LDI r3, 97
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
