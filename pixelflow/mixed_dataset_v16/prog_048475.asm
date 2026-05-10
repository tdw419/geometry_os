; DESCRIPTION: Places a magenta line segment connecting (314, 24) to (44, 86).
; PLAN: r0=314(x1), r1=24(y1), r2=44(x2), r3=86(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 314
LDI r1, 24
LDI r2, 44
LDI r3, 86
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
