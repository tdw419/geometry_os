; DESCRIPTION: Composite: . Then Creates a purple circular shape at (114, 172) with radius 80. Then Places a orange line segment connecting (212, 66) to (194, 104).
; PLAN: r0=114(x), r1=172(y), r2=80(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=212(x1), r1=66(y1), r2=194(x2), r3=104(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Creates a purple circular shape at (114, 172) with radius 80.
; PLAN: r0=114(x), r1=172(y), r2=80(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 114
LDI r1, 172
LDI r2, 80
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a orange line segment connecting (212, 66) to (194, 104).
; PLAN: r0=212(x1), r1=66(y1), r2=194(x2), r3=104(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 212
LDI r1, 66
LDI r2, 194
LDI r3, 104
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
