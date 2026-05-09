; DESCRIPTION: Draws a purple rectangle at (195, 37) with width 39 and height 73.
; PLAN: r0=195(x), r1=37(y), r2=39(width), r3=73(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 195
LDI r1, 37
LDI r2, 39
LDI r3, 73
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
