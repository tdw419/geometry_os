; DESCRIPTION: Draws a purple rectangle at (136, 151) with width 103 and height 97.
; PLAN: r0=136(x), r1=151(y), r2=103(width), r3=97(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 136
LDI r1, 151
LDI r2, 103
LDI r3, 97
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
