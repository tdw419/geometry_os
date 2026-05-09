; DESCRIPTION: Places a purple line segment connecting (276, 46) to (223, 147).
; PLAN: r0=276(x1), r1=46(y1), r2=223(x2), r3=147(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 276
LDI r1, 46
LDI r2, 223
LDI r3, 147
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
