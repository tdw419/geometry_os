; DESCRIPTION: Draws a purple rectangle at (361, 3) with width 67 and height 91.
; PLAN: r0=361(x), r1=3(y), r2=67(width), r3=91(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 361
LDI r1, 3
LDI r2, 67
LDI r3, 91
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
