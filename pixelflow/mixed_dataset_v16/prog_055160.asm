; DESCRIPTION: Draws a purple rectangle at (397, 148) with width 71 and height 99.
; PLAN: r0=397(x), r1=148(y), r2=71(width), r3=99(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 397
LDI r1, 148
LDI r2, 71
LDI r3, 99
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
