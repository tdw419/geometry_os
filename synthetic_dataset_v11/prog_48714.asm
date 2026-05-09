; DESCRIPTION: Composite: . Then Renders a purple line between points (78, 94) and (249, 88). Then Renders a blue disk with center (220, 153) and radius 10.
; PLAN: r0=78(x1), r1=94(y1), r2=249(x2), r3=88(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=220(x), r1=153(y), r2=10(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Renders a purple line between points (78, 94) and (249, 88).
; PLAN: r0=78(x1), r1=94(y1), r2=249(x2), r3=88(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 78
LDI r1, 94
LDI r2, 249
LDI r3, 88
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Renders a blue disk with center (220, 153) and radius 10.
; PLAN: r0=220(x), r1=153(y), r2=10(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 220
LDI r1, 153
LDI r2, 10
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
