; DESCRIPTION: Draws a red rectangle at (97, 106) with width 51 and height 108.
; PLAN: r0=97(x), r1=106(y), r2=51(width), r3=108(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 97
LDI r1, 106
LDI r2, 51
LDI r3, 108
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
