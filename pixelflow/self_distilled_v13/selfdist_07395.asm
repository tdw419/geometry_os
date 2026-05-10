; DESCRIPTION: Draws a green rectangle at (264, 200) with width 26 and height 75.
; PLAN: r0=264(x), r1=200(y), r2=26(width), r3=75(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 264
LDI r1, 200
LDI r2, 26
LDI r3, 75
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
