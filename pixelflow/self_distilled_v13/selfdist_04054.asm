; DESCRIPTION: Draws a purple rectangle at (297, 180) with width 43 and height 29.
; PLAN: r0=297(x), r1=180(y), r2=43(width), r3=29(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 297
LDI r1, 180
LDI r2, 43
LDI r3, 29
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
