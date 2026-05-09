; DESCRIPTION: Places a magenta line segment connecting (424, 31) to (418, 185).
; PLAN: r0=424(x1), r1=31(y1), r2=418(x2), r3=185(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 424
LDI r1, 31
LDI r2, 418
LDI r3, 185
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
