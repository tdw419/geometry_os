; DESCRIPTION: Draws a purple rectangle at (164, 153) with width 14 and height 31.
; PLAN: r0=164(x), r1=153(y), r2=14(width), r3=31(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 164
LDI r1, 153
LDI r2, 14
LDI r3, 31
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
