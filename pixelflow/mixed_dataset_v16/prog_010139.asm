; DESCRIPTION: Draws a white rectangle at (155, 185) with width 35 and height 71.
; PLAN: r0=155(x), r1=185(y), r2=35(width), r3=71(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 155
LDI r1, 185
LDI r2, 35
LDI r3, 71
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
