; DESCRIPTION: Draws a green rectangle at (102, 26) with width 22 and height 47.
; PLAN: r0=102(x), r1=26(y), r2=22(width), r3=47(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 102
LDI r1, 26
LDI r2, 22
LDI r3, 47
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
