; DESCRIPTION: Draws a purple rectangle at (98, 169) with width 34 and height 65.
; PLAN: r0=98(x), r1=169(y), r2=34(width), r3=65(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 98
LDI r1, 169
LDI r2, 34
LDI r3, 65
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
