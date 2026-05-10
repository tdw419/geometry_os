; DESCRIPTION: Draws a purple rectangle at (151, 115) with width 96 and height 36.
; PLAN: r0=151(x), r1=115(y), r2=96(width), r3=36(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 151
LDI r1, 115
LDI r2, 96
LDI r3, 36
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
