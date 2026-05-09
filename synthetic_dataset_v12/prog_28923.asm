; DESCRIPTION: Places a magenta line segment connecting (31, 97) to (325, 190).
; PLAN: r0=31(x1), r1=97(y1), r2=325(x2), r3=190(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 31
LDI r1, 97
LDI r2, 325
LDI r3, 190
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
