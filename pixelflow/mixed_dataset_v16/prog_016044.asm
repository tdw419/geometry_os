; DESCRIPTION: Places a black line segment connecting (248, 118) to (40, 10).
; PLAN: r0=248(x1), r1=118(y1), r2=40(x2), r3=10(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 248
LDI r1, 118
LDI r2, 40
LDI r3, 10
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
