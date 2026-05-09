; DESCRIPTION: Draws a purple rectangle at (183, 125) with width 28 and height 115.
; PLAN: r0=183(x), r1=125(y), r2=28(width), r3=115(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 183
LDI r1, 125
LDI r2, 28
LDI r3, 115
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
