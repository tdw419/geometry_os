; DESCRIPTION: Draws a red rectangle at (97, 175) with width 31 and height 115.
; PLAN: r0=97(x), r1=175(y), r2=31(width), r3=115(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 97
LDI r1, 175
LDI r2, 31
LDI r3, 115
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
