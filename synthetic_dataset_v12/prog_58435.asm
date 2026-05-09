; DESCRIPTION: Places a magenta line segment connecting (221, 190) to (53, 188).
; PLAN: r0=221(x1), r1=190(y1), r2=53(x2), r3=188(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 221
LDI r1, 190
LDI r2, 53
LDI r3, 188
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
