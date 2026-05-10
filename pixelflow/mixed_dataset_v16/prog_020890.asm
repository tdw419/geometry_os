; DESCRIPTION: Places a magenta line segment connecting (418, 89) to (62, 174).
; PLAN: r0=418(x1), r1=89(y1), r2=62(x2), r3=174(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 418
LDI r1, 89
LDI r2, 62
LDI r3, 174
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
