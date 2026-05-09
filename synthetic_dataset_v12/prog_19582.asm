; DESCRIPTION: Places a green line segment connecting (191, 100) to (432, 247).
; PLAN: r0=191(x1), r1=100(y1), r2=432(x2), r3=247(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 191
LDI r1, 100
LDI r2, 432
LDI r3, 247
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
