; DESCRIPTION: Draws a purple rectangle at (11, 32) with width 81 and height 14.
; PLAN: r0=11(x), r1=32(y), r2=81(width), r3=14(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 11
LDI r1, 32
LDI r2, 81
LDI r3, 14
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
