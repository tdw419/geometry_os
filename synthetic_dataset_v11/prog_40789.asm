; DESCRIPTION: Composite: . Then Places a blue circle of radius 72 at center (153, 179). Then Places a blue line segment connecting (56, 61) to (40, 219).
; PLAN: r0=153(x), r1=179(y), r2=72(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=56(x1), r1=61(y1), r2=40(x2), r3=219(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a blue circle of radius 72 at center (153, 179).
; PLAN: r0=153(x), r1=179(y), r2=72(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 153
LDI r1, 179
LDI r2, 72
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a blue line segment connecting (56, 61) to (40, 219).
; PLAN: r0=56(x1), r1=61(y1), r2=40(x2), r3=219(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 56
LDI r1, 61
LDI r2, 40
LDI r3, 219
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
