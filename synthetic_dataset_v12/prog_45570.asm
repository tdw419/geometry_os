; DESCRIPTION: Places a black line segment connecting (264, 89) to (323, 87).
; PLAN: r0=264(x1), r1=89(y1), r2=323(x2), r3=87(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 264
LDI r1, 89
LDI r2, 323
LDI r3, 87
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
