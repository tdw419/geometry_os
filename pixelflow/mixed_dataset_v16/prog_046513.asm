; DESCRIPTION: Draws a green rectangle at (321, 122) with width 53 and height 89.
; PLAN: r0=321(x), r1=122(y), r2=53(width), r3=89(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 321
LDI r1, 122
LDI r2, 53
LDI r3, 89
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
