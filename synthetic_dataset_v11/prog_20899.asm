; DESCRIPTION: Composite: . Then Renders a purple line between points (252, 115) and (211, 90). Then Draws a purple rectangle at (56, 88) with width 105 and height 78.
; PLAN: r0=252(x1), r1=115(y1), r2=211(x2), r3=90(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=56(x), r1=88(y), r2=105(width), r3=78(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a purple line between points (252, 115) and (211, 90).
; PLAN: r0=252(x1), r1=115(y1), r2=211(x2), r3=90(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 252
LDI r1, 115
LDI r2, 211
LDI r3, 90
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Draws a purple rectangle at (56, 88) with width 105 and height 78.
; PLAN: r0=56(x), r1=88(y), r2=105(width), r3=78(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 56
LDI r1, 88
LDI r2, 105
LDI r3, 78
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
