; DESCRIPTION: Composite: . Then Renders a purple line between points (158, 214) and (239, 142). Then Places a purple circle of radius 49 at center (108, 104).
; PLAN: r0=158(x1), r1=214(y1), r2=239(x2), r3=142(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=108(x), r1=104(y), r2=49(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Renders a purple line between points (158, 214) and (239, 142).
; PLAN: r0=158(x1), r1=214(y1), r2=239(x2), r3=142(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 158
LDI r1, 214
LDI r2, 239
LDI r3, 142
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a purple circle of radius 49 at center (108, 104).
; PLAN: r0=108(x), r1=104(y), r2=49(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 108
LDI r1, 104
LDI r2, 49
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
