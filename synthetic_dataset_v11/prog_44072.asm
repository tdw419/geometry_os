; DESCRIPTION: Draws a green rectangle at (118, 101) with width 108 and height 65.
; PLAN: r0=118(x), r1=101(y), r2=108(width), r3=65(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 118
LDI r1, 101
LDI r2, 108
LDI r3, 65
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
