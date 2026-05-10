; DESCRIPTION: Places a yellow line segment connecting (456, 74) to (190, 201).
; PLAN: r0=456(x1), r1=74(y1), r2=190(x2), r3=201(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 456
LDI r1, 74
LDI r2, 190
LDI r3, 201
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
