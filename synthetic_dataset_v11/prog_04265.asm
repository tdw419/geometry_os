; DESCRIPTION: Places a yellow line segment connecting (97, 87) to (251, 179).
; PLAN: r0=97(x1), r1=87(y1), r2=251(x2), r3=179(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 97
LDI r1, 87
LDI r2, 251
LDI r3, 179
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
