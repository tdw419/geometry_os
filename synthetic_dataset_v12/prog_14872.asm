; DESCRIPTION: Draws a green rectangle at (390, 151) with width 80 and height 102.
; PLAN: r0=390(x), r1=151(y), r2=80(width), r3=102(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 390
LDI r1, 151
LDI r2, 80
LDI r3, 102
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
