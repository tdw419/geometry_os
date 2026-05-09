; DESCRIPTION: Draws a purple rectangle at (19, 52) with width 96 and height 48.
; PLAN: r0=19(x), r1=52(y), r2=96(width), r3=48(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 19
LDI r1, 52
LDI r2, 96
LDI r3, 48
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
