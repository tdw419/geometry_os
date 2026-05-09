; DESCRIPTION: Composite: . Then Creates a yellow circular shape at (103, 172) with radius 47. Then Places a purple line segment connecting (162, 136) to (174, 109).
; PLAN: r0=103(x), r1=172(y), r2=47(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=162(x1), r1=136(y1), r2=174(x2), r3=109(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Creates a yellow circular shape at (103, 172) with radius 47.
; PLAN: r0=103(x), r1=172(y), r2=47(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 103
LDI r1, 172
LDI r2, 47
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a purple line segment connecting (162, 136) to (174, 109).
; PLAN: r0=162(x1), r1=136(y1), r2=174(x2), r3=109(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 162
LDI r1, 136
LDI r2, 174
LDI r3, 109
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
