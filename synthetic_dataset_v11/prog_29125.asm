; DESCRIPTION: Draws a purple rectangle at (100, 3) with width 69 and height 117.
; PLAN: r0=100(x), r1=3(y), r2=69(width), r3=117(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 100
LDI r1, 3
LDI r2, 69
LDI r3, 117
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
