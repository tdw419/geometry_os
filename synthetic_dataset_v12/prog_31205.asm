; DESCRIPTION: Places a red line segment connecting (366, 251) to (353, 91).
; PLAN: r0=366(x1), r1=251(y1), r2=353(x2), r3=91(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 366
LDI r1, 251
LDI r2, 353
LDI r3, 91
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
