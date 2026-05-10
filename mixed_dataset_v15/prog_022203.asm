; DESCRIPTION: Draws a black rectangle at (249, 140) with width 35 and height 97.
; PLAN: r0=249(x), r1=140(y), r2=35(width), r3=97(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 249
LDI r1, 140
LDI r2, 35
LDI r3, 97
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
