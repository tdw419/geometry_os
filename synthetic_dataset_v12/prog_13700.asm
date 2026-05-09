; DESCRIPTION: Places a black line segment connecting (7, 53) to (186, 58).
; PLAN: r0=7(x1), r1=53(y1), r2=186(x2), r3=58(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 7
LDI r1, 53
LDI r2, 186
LDI r3, 58
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
