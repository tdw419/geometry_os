; DESCRIPTION: Draws a purple rectangle at (179, 96) with width 73 and height 25.
; PLAN: r0=179(x), r1=96(y), r2=73(width), r3=25(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 179
LDI r1, 96
LDI r2, 73
LDI r3, 25
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
