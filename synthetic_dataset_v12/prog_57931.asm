; DESCRIPTION: Draws a purple rectangle at (318, 222) with width 40 and height 10.
; PLAN: r0=318(x), r1=222(y), r2=40(width), r3=10(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 318
LDI r1, 222
LDI r2, 40
LDI r3, 10
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
