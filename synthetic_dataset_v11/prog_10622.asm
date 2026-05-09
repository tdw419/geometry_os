; DESCRIPTION: Draws a red rectangle at (97, 97) with width 119 and height 35.
; PLAN: r0=97(x), r1=97(y), r2=119(width), r3=35(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 97
LDI r1, 97
LDI r2, 119
LDI r3, 35
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
