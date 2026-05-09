; DESCRIPTION: Draws a purple rectangle at (100, 69) with width 74 and height 24.
; PLAN: r0=100(x), r1=69(y), r2=74(width), r3=24(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 100
LDI r1, 69
LDI r2, 74
LDI r3, 24
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
