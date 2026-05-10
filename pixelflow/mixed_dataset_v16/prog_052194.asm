; DESCRIPTION: Draws a purple rectangle at (341, 115) with width 105 and height 39.
; PLAN: r0=341(x), r1=115(y), r2=105(width), r3=39(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 341
LDI r1, 115
LDI r2, 105
LDI r3, 39
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
