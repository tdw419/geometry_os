; DESCRIPTION: Places a black line segment connecting (94, 37) to (423, 77).
; PLAN: r0=94(x1), r1=37(y1), r2=423(x2), r3=77(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 94
LDI r1, 37
LDI r2, 423
LDI r3, 77
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
