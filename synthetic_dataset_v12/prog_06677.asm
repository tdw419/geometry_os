; DESCRIPTION: Draws a purple rectangle at (368, 97) with width 17 and height 97.
; PLAN: r0=368(x), r1=97(y), r2=17(width), r3=97(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 368
LDI r1, 97
LDI r2, 17
LDI r3, 97
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
