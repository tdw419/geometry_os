; DESCRIPTION: Draws a black rectangle at (140, 36) with width 26 and height 97.
; PLAN: r0=140(x), r1=36(y), r2=26(width), r3=97(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 140
LDI r1, 36
LDI r2, 26
LDI r3, 97
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
