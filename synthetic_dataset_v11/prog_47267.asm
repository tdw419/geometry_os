; DESCRIPTION: Draws a purple rectangle at (44, 103) with width 73 and height 108.
; PLAN: r0=44(x), r1=103(y), r2=73(width), r3=108(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 44
LDI r1, 103
LDI r2, 73
LDI r3, 108
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
