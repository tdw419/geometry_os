; DESCRIPTION: Draws a purple rectangle at (33, 73) with width 117 and height 69.
; PLAN: r0=33(x), r1=73(y), r2=117(width), r3=69(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 33
LDI r1, 73
LDI r2, 117
LDI r3, 69
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
