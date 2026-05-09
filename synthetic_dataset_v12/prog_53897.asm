; DESCRIPTION: Draws a purple rectangle at (101, 121) with width 86 and height 77.
; PLAN: r0=101(x), r1=121(y), r2=86(width), r3=77(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 101
LDI r1, 121
LDI r2, 86
LDI r3, 77
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
