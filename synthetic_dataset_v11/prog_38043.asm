; DESCRIPTION: Composite: . Then Places a blue line segment connecting (98, 200) to (0, 57). Then Places a purple circle of radius 69 at center (181, 82).
; PLAN: r0=98(x1), r1=200(y1), r2=0(x2), r3=57(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=181(x), r1=82(y), r2=69(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a blue line segment connecting (98, 200) to (0, 57).
; PLAN: r0=98(x1), r1=200(y1), r2=0(x2), r3=57(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 98
LDI r1, 200
LDI r2, 0
LDI r3, 57
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a purple circle of radius 69 at center (181, 82).
; PLAN: r0=181(x), r1=82(y), r2=69(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 181
LDI r1, 82
LDI r2, 69
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
