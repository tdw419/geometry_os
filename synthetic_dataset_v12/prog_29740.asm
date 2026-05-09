; DESCRIPTION: Places a black line segment connecting (258, 182) to (38, 15).
; PLAN: r0=258(x1), r1=182(y1), r2=38(x2), r3=15(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 258
LDI r1, 182
LDI r2, 38
LDI r3, 15
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
