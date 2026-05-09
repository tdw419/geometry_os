; DESCRIPTION: Draws a purple rectangle at (114, 209) with width 119 and height 39.
; PLAN: r0=114(x), r1=209(y), r2=119(width), r3=39(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 114
LDI r1, 209
LDI r2, 119
LDI r3, 39
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
