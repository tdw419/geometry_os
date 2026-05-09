; DESCRIPTION: Places a green line segment connecting (190, 185) to (162, 248).
; PLAN: r0=190(x1), r1=185(y1), r2=162(x2), r3=248(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 190
LDI r1, 185
LDI r2, 162
LDI r3, 248
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
