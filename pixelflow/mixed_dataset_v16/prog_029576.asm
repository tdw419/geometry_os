; DESCRIPTION: Places a purple line segment connecting (193, 87) to (132, 105).
; PLAN: r0=193(x1), r1=87(y1), r2=132(x2), r3=105(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 193
LDI r1, 87
LDI r2, 132
LDI r3, 105
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
