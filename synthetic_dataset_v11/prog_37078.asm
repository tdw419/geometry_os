; DESCRIPTION: Composite: . Then Places a purple line segment connecting (96, 74) to (48, 23). Then Renders a blue disk with center (99, 52) and radius 47.
; PLAN: r0=96(x1), r1=74(y1), r2=48(x2), r3=23(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=99(x), r1=52(y), r2=47(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a purple line segment connecting (96, 74) to (48, 23).
; PLAN: r0=96(x1), r1=74(y1), r2=48(x2), r3=23(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 96
LDI r1, 74
LDI r2, 48
LDI r3, 23
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Renders a blue disk with center (99, 52) and radius 47.
; PLAN: r0=99(x), r1=52(y), r2=47(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 99
LDI r1, 52
LDI r2, 47
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
