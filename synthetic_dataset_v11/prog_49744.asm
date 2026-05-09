; DESCRIPTION: Draws a purple rectangle at (7, 18) with width 45 and height 84.
; PLAN: r0=7(x), r1=18(y), r2=45(width), r3=84(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 7
LDI r1, 18
LDI r2, 45
LDI r3, 84
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
