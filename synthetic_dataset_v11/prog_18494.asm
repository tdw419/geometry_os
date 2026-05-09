; DESCRIPTION: Places a purple line segment connecting (22, 254) to (3, 208).
; PLAN: r0=22(x1), r1=254(y1), r2=3(x2), r3=208(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 22
LDI r1, 254
LDI r2, 3
LDI r3, 208
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
