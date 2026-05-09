; DESCRIPTION: Places a magenta line segment connecting (383, 137) to (97, 65).
; PLAN: r0=383(x1), r1=137(y1), r2=97(x2), r3=65(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 383
LDI r1, 137
LDI r2, 97
LDI r3, 65
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
