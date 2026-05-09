; DESCRIPTION: Draws a purple rectangle at (361, 38) with width 60 and height 49.
; PLAN: r0=361(x), r1=38(y), r2=60(width), r3=49(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 361
LDI r1, 38
LDI r2, 60
LDI r3, 49
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
