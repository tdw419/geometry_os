; DESCRIPTION: Draws a green rectangle at (65, 122) with width 13 and height 98.
; PLAN: r0=65(x), r1=122(y), r2=13(width), r3=98(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 65
LDI r1, 122
LDI r2, 13
LDI r3, 98
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
