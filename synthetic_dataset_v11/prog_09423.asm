; DESCRIPTION: Places a yellow line segment connecting (212, 13) to (77, 140).
; PLAN: r0=212(x1), r1=13(y1), r2=77(x2), r3=140(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 212
LDI r1, 13
LDI r2, 77
LDI r3, 140
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
