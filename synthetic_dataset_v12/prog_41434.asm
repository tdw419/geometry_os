; DESCRIPTION: Draws a purple rectangle at (102, 22) with width 69 and height 56.
; PLAN: r0=102(x), r1=22(y), r2=69(width), r3=56(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 102
LDI r1, 22
LDI r2, 69
LDI r3, 56
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
