; DESCRIPTION: Places a purple line segment connecting (322, 41) to (36, 13).
; PLAN: r0=322(x1), r1=41(y1), r2=36(x2), r3=13(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 322
LDI r1, 41
LDI r2, 36
LDI r3, 13
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
