; DESCRIPTION: Composite: . Then Draws a purple rectangle at (82, 165) with width 31 and height 70. Then Renders a purple line between points (216, 35) and (99, 61).
; PLAN: r0=82(x), r1=165(y), r2=31(width), r3=70(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=216(x1), r1=35(y1), r2=99(x2), r3=61(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a purple rectangle at (82, 165) with width 31 and height 70.
; PLAN: r0=82(x), r1=165(y), r2=31(width), r3=70(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 82
LDI r1, 165
LDI r2, 31
LDI r3, 70
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Renders a purple line between points (216, 35) and (99, 61).
; PLAN: r0=216(x1), r1=35(y1), r2=99(x2), r3=61(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 216
LDI r1, 35
LDI r2, 99
LDI r3, 61
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
