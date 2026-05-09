; DESCRIPTION: Composite: . Then Creates a purple circular shape at (155, 88) with radius 60. Then Places a orange line segment connecting (51, 180) to (193, 58).
; PLAN: r0=155(x), r1=88(y), r2=60(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=51(x1), r1=180(y1), r2=193(x2), r3=58(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Creates a purple circular shape at (155, 88) with radius 60.
; PLAN: r0=155(x), r1=88(y), r2=60(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 155
LDI r1, 88
LDI r2, 60
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a orange line segment connecting (51, 180) to (193, 58).
; PLAN: r0=51(x1), r1=180(y1), r2=193(x2), r3=58(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 51
LDI r1, 180
LDI r2, 193
LDI r3, 58
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
