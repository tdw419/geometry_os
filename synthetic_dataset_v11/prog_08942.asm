; DESCRIPTION: Draws a purple rectangle at (122, 235) with width 40 and height 11.
; PLAN: r0=122(x), r1=235(y), r2=40(width), r3=11(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 122
LDI r1, 235
LDI r2, 40
LDI r3, 11
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
