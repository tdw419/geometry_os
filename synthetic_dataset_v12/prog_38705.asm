; DESCRIPTION: Draws a purple rectangle at (359, 208) with width 107 and height 38.
; PLAN: r0=359(x), r1=208(y), r2=107(width), r3=38(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 359
LDI r1, 208
LDI r2, 107
LDI r3, 38
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
