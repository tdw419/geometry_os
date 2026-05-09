; DESCRIPTION: Composite: . Then Places a purple circle of radius 49 at center (129, 72). Then Draws a green line from (194, 136) to (134, 196).
; PLAN: r0=129(x), r1=72(y), r2=49(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=194(x1), r1=136(y1), r2=134(x2), r3=196(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a purple circle of radius 49 at center (129, 72).
; PLAN: r0=129(x), r1=72(y), r2=49(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 129
LDI r1, 72
LDI r2, 49
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Draws a green line from (194, 136) to (134, 196).
; PLAN: r0=194(x1), r1=136(y1), r2=134(x2), r3=196(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 194
LDI r1, 136
LDI r2, 134
LDI r3, 196
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
