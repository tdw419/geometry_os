; DESCRIPTION: Draws a green rectangle at (390, 5) with width 86 and height 66.
; PLAN: r0=390(x), r1=5(y), r2=86(width), r3=66(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 390
LDI r1, 5
LDI r2, 86
LDI r3, 66
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
