; DESCRIPTION: Draws a green rectangle at (191, 7) with width 34 and height 118.
; PLAN: r0=191(x), r1=7(y), r2=34(width), r3=118(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 191
LDI r1, 7
LDI r2, 34
LDI r3, 118
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
