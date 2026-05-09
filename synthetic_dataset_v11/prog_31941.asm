; DESCRIPTION: Places a red line segment connecting (56, 192) to (248, 66).
; PLAN: r0=56(x1), r1=192(y1), r2=248(x2), r3=66(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 56
LDI r1, 192
LDI r2, 248
LDI r3, 66
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
