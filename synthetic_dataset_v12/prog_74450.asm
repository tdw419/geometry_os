; DESCRIPTION: Draws a purple rectangle at (333, 219) with width 66 and height 30.
; PLAN: r0=333(x), r1=219(y), r2=66(width), r3=30(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 333
LDI r1, 219
LDI r2, 66
LDI r3, 30
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
