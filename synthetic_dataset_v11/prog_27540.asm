; DESCRIPTION: Composite: . Then Places a blue circle of radius 10 at center (201, 178). Then Places a orange line segment connecting (89, 207) to (216, 233).
; PLAN: r0=201(x), r1=178(y), r2=10(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=89(x1), r1=207(y1), r2=216(x2), r3=233(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a blue circle of radius 10 at center (201, 178).
; PLAN: r0=201(x), r1=178(y), r2=10(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 201
LDI r1, 178
LDI r2, 10
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a orange line segment connecting (89, 207) to (216, 233).
; PLAN: r0=89(x1), r1=207(y1), r2=216(x2), r3=233(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 89
LDI r1, 207
LDI r2, 216
LDI r3, 233
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
