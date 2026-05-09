; DESCRIPTION: Draws a yellow rectangle at (158, 66) with width 70 and height 94.
; PLAN: r0=158(x), r1=66(y), r2=70(width), r3=94(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 158
LDI r1, 66
LDI r2, 70
LDI r3, 94
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
