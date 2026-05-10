; DESCRIPTION: Places a purple line segment connecting (452, 123) to (328, 140).
; PLAN: r0=452(x1), r1=123(y1), r2=328(x2), r3=140(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 452
LDI r1, 123
LDI r2, 328
LDI r3, 140
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
