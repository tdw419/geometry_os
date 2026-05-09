; DESCRIPTION: Draws a purple rectangle at (382, 182) with width 99 and height 74.
; PLAN: r0=382(x), r1=182(y), r2=99(width), r3=74(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 382
LDI r1, 182
LDI r2, 99
LDI r3, 74
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
