; DESCRIPTION: Places a black line segment connecting (201, 49) to (32, 137).
; PLAN: r0=201(x1), r1=49(y1), r2=32(x2), r3=137(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 201
LDI r1, 49
LDI r2, 32
LDI r3, 137
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
