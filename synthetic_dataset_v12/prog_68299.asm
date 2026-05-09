; DESCRIPTION: Draws a purple rectangle at (71, 40) with width 26 and height 48.
; PLAN: r0=71(x), r1=40(y), r2=26(width), r3=48(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 71
LDI r1, 40
LDI r2, 26
LDI r3, 48
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
