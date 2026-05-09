; DESCRIPTION: Places a purple line segment connecting (97, 86) to (132, 231).
; PLAN: r0=97(x1), r1=86(y1), r2=132(x2), r3=231(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 97
LDI r1, 86
LDI r2, 132
LDI r3, 231
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
