; DESCRIPTION: Draws a purple rectangle at (371, 161) with width 102 and height 73.
; PLAN: r0=371(x), r1=161(y), r2=102(width), r3=73(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 371
LDI r1, 161
LDI r2, 102
LDI r3, 73
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
