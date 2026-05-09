; DESCRIPTION: Draws a purple rectangle at (324, 13) with width 21 and height 96.
; PLAN: r0=324(x), r1=13(y), r2=21(width), r3=96(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 324
LDI r1, 13
LDI r2, 21
LDI r3, 96
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
