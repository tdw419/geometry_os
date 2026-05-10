; DESCRIPTION: Places a black line segment connecting (314, 187) to (97, 196).
; PLAN: r0=314(x1), r1=187(y1), r2=97(x2), r3=196(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 314
LDI r1, 187
LDI r2, 97
LDI r3, 196
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
