; DESCRIPTION: Places a purple line segment connecting (325, 214) to (408, 22).
; PLAN: r0=325(x1), r1=214(y1), r2=408(x2), r3=22(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 325
LDI r1, 214
LDI r2, 408
LDI r3, 22
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
