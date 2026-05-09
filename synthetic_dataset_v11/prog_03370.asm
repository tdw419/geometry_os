; DESCRIPTION: Composite: . Then Creates a purple circular shape at (117, 58) with radius 50. Then Places a magenta line segment connecting (185, 137) to (2, 33).
; PLAN: r0=117(x), r1=58(y), r2=50(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=185(x1), r1=137(y1), r2=2(x2), r3=33(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Creates a purple circular shape at (117, 58) with radius 50.
; PLAN: r0=117(x), r1=58(y), r2=50(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 117
LDI r1, 58
LDI r2, 50
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a magenta line segment connecting (185, 137) to (2, 33).
; PLAN: r0=185(x1), r1=137(y1), r2=2(x2), r3=33(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 185
LDI r1, 137
LDI r2, 2
LDI r3, 33
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
