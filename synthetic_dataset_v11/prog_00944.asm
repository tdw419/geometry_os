; DESCRIPTION: Composite: . Then Renders a purple line between points (119, 145) and (13, 129). Then Draws a purple rectangle at (61, 176) with width 115 and height 37.
; PLAN: r0=119(x1), r1=145(y1), r2=13(x2), r3=129(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=61(x), r1=176(y), r2=115(width), r3=37(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a purple line between points (119, 145) and (13, 129).
; PLAN: r0=119(x1), r1=145(y1), r2=13(x2), r3=129(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 119
LDI r1, 145
LDI r2, 13
LDI r3, 129
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Draws a purple rectangle at (61, 176) with width 115 and height 37.
; PLAN: r0=61(x), r1=176(y), r2=115(width), r3=37(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 61
LDI r1, 176
LDI r2, 115
LDI r3, 37
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
