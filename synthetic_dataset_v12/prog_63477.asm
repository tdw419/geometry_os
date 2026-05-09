; DESCRIPTION: Places a purple line segment connecting (301, 22) to (455, 13).
; PLAN: r0=301(x1), r1=22(y1), r2=455(x2), r3=13(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 301
LDI r1, 22
LDI r2, 455
LDI r3, 13
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
