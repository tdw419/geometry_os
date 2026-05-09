; DESCRIPTION: Draws a purple rectangle at (76, 47) with width 103 and height 44.
; PLAN: r0=76(x), r1=47(y), r2=103(width), r3=44(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 76
LDI r1, 47
LDI r2, 103
LDI r3, 44
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
