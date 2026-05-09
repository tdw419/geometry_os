; DESCRIPTION: Places a yellow line segment connecting (248, 92) to (177, 54).
; PLAN: r0=248(x1), r1=92(y1), r2=177(x2), r3=54(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 248
LDI r1, 92
LDI r2, 177
LDI r3, 54
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
