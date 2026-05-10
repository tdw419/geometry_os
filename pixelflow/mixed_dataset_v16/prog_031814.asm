; DESCRIPTION: Draws a purple rectangle at (164, 1) with width 83 and height 96.
; PLAN: r0=164(x), r1=1(y), r2=83(width), r3=96(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 164
LDI r1, 1
LDI r2, 83
LDI r3, 96
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
