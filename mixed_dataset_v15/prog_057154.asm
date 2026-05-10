; DESCRIPTION: Draws a purple rectangle at (230, 56) with width 76 and height 98.
; PLAN: r0=230(x), r1=56(y), r2=76(width), r3=98(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 230
LDI r1, 56
LDI r2, 76
LDI r3, 98
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
