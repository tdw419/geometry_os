; DESCRIPTION: Draws a green rectangle at (314, 101) with width 107 and height 34.
; PLAN: r0=314(x), r1=101(y), r2=107(width), r3=34(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 314
LDI r1, 101
LDI r2, 107
LDI r3, 34
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
