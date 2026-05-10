; DESCRIPTION: Draws a purple rectangle at (194, 171) with width 71 and height 32.
; PLAN: r0=194(x), r1=171(y), r2=71(width), r3=32(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 194
LDI r1, 171
LDI r2, 71
LDI r3, 32
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
