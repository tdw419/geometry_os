; DESCRIPTION: Draws a purple rectangle at (390, 22) with width 65 and height 27.
; PLAN: r0=390(x), r1=22(y), r2=65(width), r3=27(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 390
LDI r1, 22
LDI r2, 65
LDI r3, 27
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
