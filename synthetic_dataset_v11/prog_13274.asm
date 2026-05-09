; DESCRIPTION: Draws a purple rectangle at (233, 8) with width 16 and height 49.
; PLAN: r0=233(x), r1=8(y), r2=16(width), r3=49(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 233
LDI r1, 8
LDI r2, 16
LDI r3, 49
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
