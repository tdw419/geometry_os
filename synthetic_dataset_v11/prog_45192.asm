; DESCRIPTION: Composite: . Then Places a purple line segment connecting (225, 14) to (235, 21). Then Renders a purple disk with center (144, 54) and radius 53.
; PLAN: r0=225(x1), r1=14(y1), r2=235(x2), r3=21(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=144(x), r1=54(y), r2=53(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a purple line segment connecting (225, 14) to (235, 21).
; PLAN: r0=225(x1), r1=14(y1), r2=235(x2), r3=21(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 225
LDI r1, 14
LDI r2, 235
LDI r3, 21
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Renders a purple disk with center (144, 54) and radius 53.
; PLAN: r0=144(x), r1=54(y), r2=53(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 144
LDI r1, 54
LDI r2, 53
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
