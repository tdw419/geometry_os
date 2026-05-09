; DESCRIPTION: Composite: . Then Renders a purple line between points (130, 119) and (89, 202). Then Creates a blue rectangular region at (52, 157) spanning 96 by 75 pixels.
; PLAN: r0=130(x1), r1=119(y1), r2=89(x2), r3=202(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=52(x), r1=157(y), r2=96(width), r3=75(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a purple line between points (130, 119) and (89, 202).
; PLAN: r0=130(x1), r1=119(y1), r2=89(x2), r3=202(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 130
LDI r1, 119
LDI r2, 89
LDI r3, 202
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Creates a blue rectangular region at (52, 157) spanning 96 by 75 pixels.
; PLAN: r0=52(x), r1=157(y), r2=96(width), r3=75(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 52
LDI r1, 157
LDI r2, 96
LDI r3, 75
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
