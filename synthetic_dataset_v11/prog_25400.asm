; DESCRIPTION: Composite: . Then Places a yellow line segment connecting (43, 80) to (39, 136). Then Creates a black circular shape at (142, 79) with radius 26.
; PLAN: r0=43(x1), r1=80(y1), r2=39(x2), r3=136(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=142(x), r1=79(y), r2=26(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a yellow line segment connecting (43, 80) to (39, 136).
; PLAN: r0=43(x1), r1=80(y1), r2=39(x2), r3=136(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 43
LDI r1, 80
LDI r2, 39
LDI r3, 136
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Creates a black circular shape at (142, 79) with radius 26.
; PLAN: r0=142(x), r1=79(y), r2=26(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 142
LDI r1, 79
LDI r2, 26
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
