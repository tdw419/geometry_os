; DESCRIPTION: Places a black line segment connecting (147, 211) to (345, 55).
; PLAN: r0=147(x1), r1=211(y1), r2=345(x2), r3=55(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 147
LDI r1, 211
LDI r2, 345
LDI r3, 55
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
