; DESCRIPTION: Draws a purple rectangle at (3, 72) with width 102 and height 72.
; PLAN: r0=3(x), r1=72(y), r2=102(width), r3=72(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 3
LDI r1, 72
LDI r2, 102
LDI r3, 72
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
