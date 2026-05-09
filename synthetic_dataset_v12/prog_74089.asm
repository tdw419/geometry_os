; DESCRIPTION: Draws a purple rectangle at (400, 169) with width 98 and height 47.
; PLAN: r0=400(x), r1=169(y), r2=98(width), r3=47(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 400
LDI r1, 169
LDI r2, 98
LDI r3, 47
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
