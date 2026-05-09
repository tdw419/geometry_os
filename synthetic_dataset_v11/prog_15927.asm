; DESCRIPTION: Composite: . Then Places a purple line segment connecting (140, 72) to (169, 250). Then Places a yellow circle of radius 80 at center (151, 120).
; PLAN: r0=140(x1), r1=72(y1), r2=169(x2), r3=250(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=151(x), r1=120(y), r2=80(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a purple line segment connecting (140, 72) to (169, 250).
; PLAN: r0=140(x1), r1=72(y1), r2=169(x2), r3=250(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 140
LDI r1, 72
LDI r2, 169
LDI r3, 250
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a yellow circle of radius 80 at center (151, 120).
; PLAN: r0=151(x), r1=120(y), r2=80(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 151
LDI r1, 120
LDI r2, 80
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
