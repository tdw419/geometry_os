; DESCRIPTION: Draws a purple rectangle at (370, 110) with width 103 and height 58.
; PLAN: r0=370(x), r1=110(y), r2=103(width), r3=58(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 370
LDI r1, 110
LDI r2, 103
LDI r3, 58
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
