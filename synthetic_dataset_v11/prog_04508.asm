; DESCRIPTION: Composite: . Then Places a purple line segment connecting (106, 108) to (170, 210). Then Renders a purple disk with center (163, 104) and radius 56.
; PLAN: r0=106(x1), r1=108(y1), r2=170(x2), r3=210(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=163(x), r1=104(y), r2=56(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a purple line segment connecting (106, 108) to (170, 210).
; PLAN: r0=106(x1), r1=108(y1), r2=170(x2), r3=210(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 106
LDI r1, 108
LDI r2, 170
LDI r3, 210
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Renders a purple disk with center (163, 104) and radius 56.
; PLAN: r0=163(x), r1=104(y), r2=56(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 163
LDI r1, 104
LDI r2, 56
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
