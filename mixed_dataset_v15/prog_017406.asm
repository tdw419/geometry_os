; DESCRIPTION: Draws a purple rectangle at (90, 88) with width 76 and height 103.
; PLAN: r0=90(x), r1=88(y), r2=76(width), r3=103(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 90
LDI r1, 88
LDI r2, 76
LDI r3, 103
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
