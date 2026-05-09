; DESCRIPTION: Draws a purple rectangle at (145, 182) with width 103 and height 67.
; PLAN: r0=145(x), r1=182(y), r2=103(width), r3=67(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 145
LDI r1, 182
LDI r2, 103
LDI r3, 67
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
