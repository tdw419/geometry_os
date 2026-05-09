; DESCRIPTION: Composite: . Then Places a yellow line segment connecting (136, 72) to (142, 47). Then Places a red circle of radius 19 at center (132, 152).
; PLAN: r0=136(x1), r1=72(y1), r2=142(x2), r3=47(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=132(x), r1=152(y), r2=19(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a yellow line segment connecting (136, 72) to (142, 47).
; PLAN: r0=136(x1), r1=72(y1), r2=142(x2), r3=47(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 136
LDI r1, 72
LDI r2, 142
LDI r3, 47
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a red circle of radius 19 at center (132, 152).
; PLAN: r0=132(x), r1=152(y), r2=19(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 132
LDI r1, 152
LDI r2, 19
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
