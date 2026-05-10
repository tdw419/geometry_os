; DESCRIPTION: Places a magenta line segment connecting (468, 86) to (477, 98).
; PLAN: r0=468(x1), r1=86(y1), r2=477(x2), r3=98(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 468
LDI r1, 86
LDI r2, 477
LDI r3, 98
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
