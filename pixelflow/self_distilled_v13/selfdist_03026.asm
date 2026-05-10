; DESCRIPTION: Draws a purple rectangle at (84, 191) with width 12 and height 81.
; PLAN: r0=84(x), r1=191(y), r2=12(width), r3=81(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 84
LDI r1, 191
LDI r2, 12
LDI r3, 81
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
