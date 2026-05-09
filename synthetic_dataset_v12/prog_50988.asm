; DESCRIPTION: Places a black line segment connecting (73, 182) to (291, 131).
; PLAN: r0=73(x1), r1=182(y1), r2=291(x2), r3=131(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 73
LDI r1, 182
LDI r2, 291
LDI r3, 131
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
