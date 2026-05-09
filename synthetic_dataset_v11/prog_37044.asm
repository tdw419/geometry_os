; DESCRIPTION: Composite: . Then Places a purple circle of radius 44 at center (162, 136). Then Renders a yellow line between points (139, 251) and (234, 18).
; PLAN: r0=162(x), r1=136(y), r2=44(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=139(x1), r1=251(y1), r2=234(x2), r3=18(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a purple circle of radius 44 at center (162, 136).
; PLAN: r0=162(x), r1=136(y), r2=44(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 162
LDI r1, 136
LDI r2, 44
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Renders a yellow line between points (139, 251) and (234, 18).
; PLAN: r0=139(x1), r1=251(y1), r2=234(x2), r3=18(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 139
LDI r1, 251
LDI r2, 234
LDI r3, 18
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
