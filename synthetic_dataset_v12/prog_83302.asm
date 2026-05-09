; DESCRIPTION: Draws a purple rectangle at (334, 142) with width 33 and height 40.
; PLAN: r0=334(x), r1=142(y), r2=33(width), r3=40(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 334
LDI r1, 142
LDI r2, 33
LDI r3, 40
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
