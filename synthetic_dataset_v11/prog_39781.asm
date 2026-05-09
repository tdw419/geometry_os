; DESCRIPTION: Places a magenta line segment connecting (139, 53) to (91, 96).
; PLAN: r0=139(x1), r1=53(y1), r2=91(x2), r3=96(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 139
LDI r1, 53
LDI r2, 91
LDI r3, 96
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
