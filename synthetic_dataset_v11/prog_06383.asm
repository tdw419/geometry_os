; DESCRIPTION: Draws a purple rectangle at (209, 61) with width 44 and height 15.
; PLAN: r0=209(x), r1=61(y), r2=44(width), r3=15(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 209
LDI r1, 61
LDI r2, 44
LDI r3, 15
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
