; DESCRIPTION: Places a yellow line segment connecting (373, 106) to (405, 89).
; PLAN: r0=373(x1), r1=106(y1), r2=405(x2), r3=89(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 373
LDI r1, 106
LDI r2, 405
LDI r3, 89
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
