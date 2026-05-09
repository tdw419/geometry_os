; DESCRIPTION: Draws a purple rectangle at (259, 24) with width 107 and height 24.
; PLAN: r0=259(x), r1=24(y), r2=107(width), r3=24(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 259
LDI r1, 24
LDI r2, 107
LDI r3, 24
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
