; DESCRIPTION: Draws a green rectangle at (13, 14) with width 78 and height 98.
; PLAN: r0=13(x), r1=14(y), r2=78(width), r3=98(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 13
LDI r1, 14
LDI r2, 78
LDI r3, 98
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
