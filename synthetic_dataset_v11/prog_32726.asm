; DESCRIPTION: Places a magenta line segment connecting (195, 139) to (201, 96).
; PLAN: r0=195(x1), r1=139(y1), r2=201(x2), r3=96(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 195
LDI r1, 139
LDI r2, 201
LDI r3, 96
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
