; DESCRIPTION: Draws a purple rectangle at (361, 4) with width 111 and height 78.
; PLAN: r0=361(x), r1=4(y), r2=111(width), r3=78(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 361
LDI r1, 4
LDI r2, 111
LDI r3, 78
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
