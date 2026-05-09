; DESCRIPTION: Draws a purple rectangle at (153, 58) with width 102 and height 119.
; PLAN: r0=153(x), r1=58(y), r2=102(width), r3=119(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 153
LDI r1, 58
LDI r2, 102
LDI r3, 119
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
