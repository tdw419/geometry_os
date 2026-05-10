; DESCRIPTION: Draws a purple rectangle at (215, 69) with width 108 and height 107.
; PLAN: r0=215(x), r1=69(y), r2=108(width), r3=107(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 215
LDI r1, 69
LDI r2, 108
LDI r3, 107
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
