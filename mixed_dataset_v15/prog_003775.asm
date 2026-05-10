; DESCRIPTION: Draws a purple rectangle at (289, 167) with width 13 and height 44.
; PLAN: r0=289(x), r1=167(y), r2=13(width), r3=44(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 289
LDI r1, 167
LDI r2, 13
LDI r3, 44
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
