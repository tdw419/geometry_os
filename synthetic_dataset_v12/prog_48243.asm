; DESCRIPTION: Draws a purple rectangle at (312, 188) with width 45 and height 58.
; PLAN: r0=312(x), r1=188(y), r2=45(width), r3=58(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 312
LDI r1, 188
LDI r2, 45
LDI r3, 58
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
