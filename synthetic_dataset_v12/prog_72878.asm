; DESCRIPTION: Draws a purple rectangle at (246, 139) with width 107 and height 117.
; PLAN: r0=246(x), r1=139(y), r2=107(width), r3=117(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 246
LDI r1, 139
LDI r2, 107
LDI r3, 117
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
