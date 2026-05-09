; DESCRIPTION: Places a black line segment connecting (331, 118) to (133, 219).
; PLAN: r0=331(x1), r1=118(y1), r2=133(x2), r3=219(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 331
LDI r1, 118
LDI r2, 133
LDI r3, 219
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
