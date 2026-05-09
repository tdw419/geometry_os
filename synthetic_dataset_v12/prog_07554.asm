; DESCRIPTION: Places a black line segment connecting (89, 66) to (176, 91).
; PLAN: r0=89(x1), r1=66(y1), r2=176(x2), r3=91(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 89
LDI r1, 66
LDI r2, 176
LDI r3, 91
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
