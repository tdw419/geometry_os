; DESCRIPTION: Places a purple line segment connecting (44, 190) to (207, 156).
; PLAN: r0=44(x1), r1=190(y1), r2=207(x2), r3=156(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 44
LDI r1, 190
LDI r2, 207
LDI r3, 156
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
