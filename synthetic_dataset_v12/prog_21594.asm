; DESCRIPTION: Places a black line segment connecting (468, 254) to (377, 208).
; PLAN: r0=468(x1), r1=254(y1), r2=377(x2), r3=208(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 468
LDI r1, 254
LDI r2, 377
LDI r3, 208
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
