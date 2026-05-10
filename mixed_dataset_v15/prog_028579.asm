; DESCRIPTION: Draws a purple rectangle at (183, 57) with width 18 and height 28.
; PLAN: r0=183(x), r1=57(y), r2=18(width), r3=28(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 183
LDI r1, 57
LDI r2, 18
LDI r3, 28
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
