; DESCRIPTION: Places a purple line segment connecting (147, 251) to (235, 49).
; PLAN: r0=147(x1), r1=251(y1), r2=235(x2), r3=49(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 147
LDI r1, 251
LDI r2, 235
LDI r3, 49
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
