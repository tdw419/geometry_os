; DESCRIPTION: Places a green line segment connecting (89, 44) to (493, 97).
; PLAN: r0=89(x1), r1=44(y1), r2=493(x2), r3=97(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 89
LDI r1, 44
LDI r2, 493
LDI r3, 97
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
