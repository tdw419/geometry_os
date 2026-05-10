; DESCRIPTION: Draws a green rectangle at (264, 50) with width 118 and height 62.
; PLAN: r0=264(x), r1=50(y), r2=118(width), r3=62(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 264
LDI r1, 50
LDI r2, 118
LDI r3, 62
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
