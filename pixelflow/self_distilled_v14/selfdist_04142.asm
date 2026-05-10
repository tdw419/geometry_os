; DESCRIPTION: Draws a purple rectangle at (336, 182) with width 14 and height 63.
; PLAN: r0=336(x), r1=182(y), r2=14(width), r3=63(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 336
LDI r1, 182
LDI r2, 14
LDI r3, 63
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
