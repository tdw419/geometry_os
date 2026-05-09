; DESCRIPTION: Places a black line segment connecting (287, 80) to (137, 241).
; PLAN: r0=287(x1), r1=80(y1), r2=137(x2), r3=241(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 287
LDI r1, 80
LDI r2, 137
LDI r3, 241
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
