; DESCRIPTION: Places a black line segment connecting (351, 107) to (119, 17).
; PLAN: r0=351(x1), r1=107(y1), r2=119(x2), r3=17(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 351
LDI r1, 107
LDI r2, 119
LDI r3, 17
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
