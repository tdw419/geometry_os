; DESCRIPTION: Places a green line segment connecting (357, 170) to (474, 169).
; PLAN: r0=357(x1), r1=170(y1), r2=474(x2), r3=169(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 357
LDI r1, 170
LDI r2, 474
LDI r3, 169
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
