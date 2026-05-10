; DESCRIPTION: Draws a purple rectangle at (135, 90) with width 117 and height 26.
; PLAN: r0=135(x), r1=90(y), r2=117(width), r3=26(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 135
LDI r1, 90
LDI r2, 117
LDI r3, 26
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
