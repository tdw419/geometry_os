; DESCRIPTION: Draws a purple rectangle at (84, 190) with width 30 and height 78.
; PLAN: r0=84(x), r1=190(y), r2=30(width), r3=78(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 84
LDI r1, 190
LDI r2, 30
LDI r3, 78
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
