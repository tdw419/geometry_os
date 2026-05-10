; DESCRIPTION: Draws a purple rectangle at (135, 65) with width 67 and height 76.
; PLAN: r0=135(x), r1=65(y), r2=67(width), r3=76(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 135
LDI r1, 65
LDI r2, 67
LDI r3, 76
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
