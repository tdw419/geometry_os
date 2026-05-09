; DESCRIPTION: Places a black line segment connecting (201, 95) to (16, 100).
; PLAN: r0=201(x1), r1=95(y1), r2=16(x2), r3=100(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 201
LDI r1, 95
LDI r2, 16
LDI r3, 100
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
