; DESCRIPTION: Places a black line segment connecting (212, 182) to (478, 38).
; PLAN: r0=212(x1), r1=182(y1), r2=478(x2), r3=38(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 212
LDI r1, 182
LDI r2, 478
LDI r3, 38
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
