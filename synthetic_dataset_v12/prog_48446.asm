; DESCRIPTION: Places a black line segment connecting (390, 123) to (26, 208).
; PLAN: r0=390(x1), r1=123(y1), r2=26(x2), r3=208(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 390
LDI r1, 123
LDI r2, 26
LDI r3, 208
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
