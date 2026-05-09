; DESCRIPTION: Draws a purple rectangle at (255, 69) with width 109 and height 81.
; PLAN: r0=255(x), r1=69(y), r2=109(width), r3=81(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 255
LDI r1, 69
LDI r2, 109
LDI r3, 81
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
