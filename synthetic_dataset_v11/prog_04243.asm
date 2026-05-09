; DESCRIPTION: Draws a purple rectangle at (236, 203) with width 14 and height 32.
; PLAN: r0=236(x), r1=203(y), r2=14(width), r3=32(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 236
LDI r1, 203
LDI r2, 14
LDI r3, 32
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
