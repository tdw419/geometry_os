; DESCRIPTION: Composite: . Then Renders a blue disk with center (175, 110) and radius 75. Then Places a blue line segment connecting (149, 17) to (183, 77).
; PLAN: r0=175(x), r1=110(y), r2=75(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=149(x1), r1=17(y1), r2=183(x2), r3=77(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a blue disk with center (175, 110) and radius 75.
; PLAN: r0=175(x), r1=110(y), r2=75(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 175
LDI r1, 110
LDI r2, 75
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a blue line segment connecting (149, 17) to (183, 77).
; PLAN: r0=149(x1), r1=17(y1), r2=183(x2), r3=77(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 149
LDI r1, 17
LDI r2, 183
LDI r3, 77
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
