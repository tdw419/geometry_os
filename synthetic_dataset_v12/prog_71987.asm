; DESCRIPTION: Draws a purple rectangle at (371, 144) with width 58 and height 55.
; PLAN: r0=371(x), r1=144(y), r2=58(width), r3=55(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 371
LDI r1, 144
LDI r2, 58
LDI r3, 55
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
