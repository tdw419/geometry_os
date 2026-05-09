; DESCRIPTION: Draws a purple rectangle at (78, 182) with width 43 and height 16.
; PLAN: r0=78(x), r1=182(y), r2=43(width), r3=16(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 78
LDI r1, 182
LDI r2, 43
LDI r3, 16
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
