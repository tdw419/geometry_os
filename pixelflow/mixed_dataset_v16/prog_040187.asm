; DESCRIPTION: Places a purple line segment connecting (138, 80) to (431, 172).
; PLAN: r0=138(x1), r1=80(y1), r2=431(x2), r3=172(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 138
LDI r1, 80
LDI r2, 431
LDI r3, 172
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
