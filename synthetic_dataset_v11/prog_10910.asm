; DESCRIPTION: Composite: . Then Places a yellow line segment connecting (89, 63) to (8, 152). Then Places a purple circle of radius 71 at center (78, 168).
; PLAN: r0=89(x1), r1=63(y1), r2=8(x2), r3=152(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=78(x), r1=168(y), r2=71(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a yellow line segment connecting (89, 63) to (8, 152).
; PLAN: r0=89(x1), r1=63(y1), r2=8(x2), r3=152(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 89
LDI r1, 63
LDI r2, 8
LDI r3, 152
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a purple circle of radius 71 at center (78, 168).
; PLAN: r0=78(x), r1=168(y), r2=71(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 78
LDI r1, 168
LDI r2, 71
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
