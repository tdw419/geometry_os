; DESCRIPTION: Draws a purple rectangle at (115, 133) with width 96 and height 117.
; PLAN: r0=115(x), r1=133(y), r2=96(width), r3=117(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 115
LDI r1, 133
LDI r2, 96
LDI r3, 117
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
