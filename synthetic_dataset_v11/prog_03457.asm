; DESCRIPTION: Places a yellow line segment connecting (190, 132) to (133, 10).
; PLAN: r0=190(x1), r1=132(y1), r2=133(x2), r3=10(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 190
LDI r1, 132
LDI r2, 133
LDI r3, 10
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
