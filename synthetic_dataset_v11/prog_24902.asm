; DESCRIPTION: Places a black line segment connecting (201, 66) to (104, 64).
; PLAN: r0=201(x1), r1=66(y1), r2=104(x2), r3=64(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 201
LDI r1, 66
LDI r2, 104
LDI r3, 64
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
