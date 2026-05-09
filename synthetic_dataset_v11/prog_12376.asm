; DESCRIPTION: Composite: . Then Places a purple line segment connecting (225, 194) to (89, 199). Then Creates a purple circular shape at (37, 56) with radius 30.
; PLAN: r0=225(x1), r1=194(y1), r2=89(x2), r3=199(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=37(x), r1=56(y), r2=30(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a purple line segment connecting (225, 194) to (89, 199).
; PLAN: r0=225(x1), r1=194(y1), r2=89(x2), r3=199(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 225
LDI r1, 194
LDI r2, 89
LDI r3, 199
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Creates a purple circular shape at (37, 56) with radius 30.
; PLAN: r0=37(x), r1=56(y), r2=30(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 37
LDI r1, 56
LDI r2, 30
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
