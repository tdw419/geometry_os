; DESCRIPTION: Draws a purple rectangle at (201, 96) with width 16 and height 68.
; PLAN: r0=201(x), r1=96(y), r2=16(width), r3=68(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 201
LDI r1, 96
LDI r2, 16
LDI r3, 68
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
