; DESCRIPTION: Places a yellow line segment connecting (427, 182) to (190, 237).
; PLAN: r0=427(x1), r1=182(y1), r2=190(x2), r3=237(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 427
LDI r1, 182
LDI r2, 190
LDI r3, 237
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
