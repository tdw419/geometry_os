; DESCRIPTION: Places a yellow line segment connecting (44, 15) to (116, 106).
; PLAN: r0=44(x1), r1=15(y1), r2=116(x2), r3=106(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 44
LDI r1, 15
LDI r2, 116
LDI r3, 106
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
