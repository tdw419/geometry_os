; DESCRIPTION: Draws a purple rectangle at (124, 144) with width 60 and height 13.
; PLAN: r0=124(x), r1=144(y), r2=60(width), r3=13(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 124
LDI r1, 144
LDI r2, 60
LDI r3, 13
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
