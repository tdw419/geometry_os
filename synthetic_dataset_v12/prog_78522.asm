; DESCRIPTION: Places a magenta line segment connecting (163, 251) to (508, 194).
; PLAN: r0=163(x1), r1=251(y1), r2=508(x2), r3=194(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 163
LDI r1, 251
LDI r2, 508
LDI r3, 194
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
