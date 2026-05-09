; DESCRIPTION: Places a black line segment connecting (198, 147) to (169, 148).
; PLAN: r0=198(x1), r1=147(y1), r2=169(x2), r3=148(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 198
LDI r1, 147
LDI r2, 169
LDI r3, 148
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
