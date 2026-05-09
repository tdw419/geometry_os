; DESCRIPTION: Composite: . Then Places a yellow line segment connecting (75, 181) to (95, 169). Then Places a blue circle of radius 11 at center (232, 100).
; PLAN: r0=75(x1), r1=181(y1), r2=95(x2), r3=169(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=232(x), r1=100(y), r2=11(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a yellow line segment connecting (75, 181) to (95, 169).
; PLAN: r0=75(x1), r1=181(y1), r2=95(x2), r3=169(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 75
LDI r1, 181
LDI r2, 95
LDI r3, 169
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a blue circle of radius 11 at center (232, 100).
; PLAN: r0=232(x), r1=100(y), r2=11(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 232
LDI r1, 100
LDI r2, 11
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
