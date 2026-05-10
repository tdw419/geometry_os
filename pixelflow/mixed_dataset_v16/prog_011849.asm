; DESCRIPTION: Places a magenta line segment connecting (201, 12) to (456, 193).
; PLAN: r0=201(x1), r1=12(y1), r2=456(x2), r3=193(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 201
LDI r1, 12
LDI r2, 456
LDI r3, 193
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
