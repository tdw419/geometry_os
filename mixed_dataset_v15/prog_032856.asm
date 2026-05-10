; DESCRIPTION: Draws a red rectangle at (321, 175) with width 97 and height 23.
; PLAN: r0=321(x), r1=175(y), r2=97(width), r3=23(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 321
LDI r1, 175
LDI r2, 97
LDI r3, 23
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
