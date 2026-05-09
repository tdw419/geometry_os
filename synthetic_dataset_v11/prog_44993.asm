; DESCRIPTION: Places a black line segment connecting (142, 172) to (147, 183).
; PLAN: r0=142(x1), r1=172(y1), r2=147(x2), r3=183(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 142
LDI r1, 172
LDI r2, 147
LDI r3, 183
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
