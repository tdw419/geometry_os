; DESCRIPTION: Places a black line segment connecting (110, 91) to (158, 66).
; PLAN: r0=110(x1), r1=91(y1), r2=158(x2), r3=66(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 110
LDI r1, 91
LDI r2, 158
LDI r3, 66
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
