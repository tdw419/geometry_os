; DESCRIPTION: Draws a green rectangle at (177, 114) with width 20 and height 94.
; PLAN: r0=177(x), r1=114(y), r2=20(width), r3=94(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 177
LDI r1, 114
LDI r2, 20
LDI r3, 94
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
