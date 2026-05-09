; DESCRIPTION: Draws a black rectangle at (145, 140) with width 26 and height 34.
; PLAN: r0=145(x), r1=140(y), r2=26(width), r3=34(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 145
LDI r1, 140
LDI r2, 26
LDI r3, 34
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
