; DESCRIPTION: Draws a purple rectangle at (195, 90) with width 40 and height 117.
; PLAN: r0=195(x), r1=90(y), r2=40(width), r3=117(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 195
LDI r1, 90
LDI r2, 40
LDI r3, 117
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
