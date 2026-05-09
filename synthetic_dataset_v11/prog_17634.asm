; DESCRIPTION: Draws a purple rectangle at (114, 17) with width 32 and height 76.
; PLAN: r0=114(x), r1=17(y), r2=32(width), r3=76(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 114
LDI r1, 17
LDI r2, 32
LDI r3, 76
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
