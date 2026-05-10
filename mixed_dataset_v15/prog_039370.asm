; DESCRIPTION: Places a purple line segment connecting (259, 187) to (97, 117).
; PLAN: r0=259(x1), r1=187(y1), r2=97(x2), r3=117(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 259
LDI r1, 187
LDI r2, 97
LDI r3, 117
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
