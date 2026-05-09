; DESCRIPTION: Draws a purple rectangle at (182, 211) with width 67 and height 19.
; PLAN: r0=182(x), r1=211(y), r2=67(width), r3=19(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 182
LDI r1, 211
LDI r2, 67
LDI r3, 19
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
