; DESCRIPTION: Draws a purple rectangle at (45, 185) with width 71 and height 53.
; PLAN: r0=45(x), r1=185(y), r2=71(width), r3=53(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 45
LDI r1, 185
LDI r2, 71
LDI r3, 53
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
