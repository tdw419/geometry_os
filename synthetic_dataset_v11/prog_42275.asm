; DESCRIPTION: Draws a purple rectangle at (40, 238) with width 110 and height 13.
; PLAN: r0=40(x), r1=238(y), r2=110(width), r3=13(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 40
LDI r1, 238
LDI r2, 110
LDI r3, 13
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
