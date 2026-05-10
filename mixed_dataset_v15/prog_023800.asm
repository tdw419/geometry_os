; DESCRIPTION: Draws a purple rectangle at (115, 130) with width 107 and height 47.
; PLAN: r0=115(x), r1=130(y), r2=107(width), r3=47(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 115
LDI r1, 130
LDI r2, 107
LDI r3, 47
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
