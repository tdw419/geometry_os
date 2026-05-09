; DESCRIPTION: Draws a green rectangle at (22, 186) with width 101 and height 47.
; PLAN: r0=22(x), r1=186(y), r2=101(width), r3=47(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 22
LDI r1, 186
LDI r2, 101
LDI r3, 47
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
