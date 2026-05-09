; DESCRIPTION: Draws a purple rectangle at (420, 157) with width 49 and height 10.
; PLAN: r0=420(x), r1=157(y), r2=49(width), r3=10(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 420
LDI r1, 157
LDI r2, 49
LDI r3, 10
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
