; DESCRIPTION: Draws a purple rectangle at (61, 183) with width 99 and height 107.
; PLAN: r0=61(x), r1=183(y), r2=99(width), r3=107(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 61
LDI r1, 183
LDI r2, 99
LDI r3, 107
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
