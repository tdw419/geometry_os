; DESCRIPTION: Places a black line segment connecting (378, 97) to (75, 119).
; PLAN: r0=378(x1), r1=97(y1), r2=75(x2), r3=119(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 378
LDI r1, 97
LDI r2, 75
LDI r3, 119
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
