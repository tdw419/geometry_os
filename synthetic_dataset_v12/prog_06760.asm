; DESCRIPTION: Places a black line segment connecting (366, 47) to (71, 211).
; PLAN: r0=366(x1), r1=47(y1), r2=71(x2), r3=211(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 366
LDI r1, 47
LDI r2, 71
LDI r3, 211
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
