; DESCRIPTION: Places a yellow line segment connecting (124, 170) to (226, 90).
; PLAN: r0=124(x1), r1=170(y1), r2=226(x2), r3=90(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 124
LDI r1, 170
LDI r2, 226
LDI r3, 90
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
