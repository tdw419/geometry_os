; DESCRIPTION: Draws a purple rectangle at (71, 60) with width 86 and height 83.
; PLAN: r0=71(x), r1=60(y), r2=86(width), r3=83(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 71
LDI r1, 60
LDI r2, 86
LDI r3, 83
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
