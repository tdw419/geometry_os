; DESCRIPTION: Draws a purple rectangle at (56, 65) with width 98 and height 12.
; PLAN: r0=56(x), r1=65(y), r2=98(width), r3=12(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 56
LDI r1, 65
LDI r2, 98
LDI r3, 12
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
