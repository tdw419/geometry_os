; DESCRIPTION: Places a purple line segment connecting (234, 123) to (188, 87).
; PLAN: r0=234(x1), r1=123(y1), r2=188(x2), r3=87(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 234
LDI r1, 123
LDI r2, 188
LDI r3, 87
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
