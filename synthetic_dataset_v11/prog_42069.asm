; DESCRIPTION: Places a black line segment connecting (170, 103) to (201, 32).
; PLAN: r0=170(x1), r1=103(y1), r2=201(x2), r3=32(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 170
LDI r1, 103
LDI r2, 201
LDI r3, 32
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
