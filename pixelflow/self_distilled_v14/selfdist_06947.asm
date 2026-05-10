; DESCRIPTION: Draws a purple rectangle at (187, 57) with width 114 and height 33.
; PLAN: r0=187(x), r1=57(y), r2=114(width), r3=33(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 187
LDI r1, 57
LDI r2, 114
LDI r3, 33
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
