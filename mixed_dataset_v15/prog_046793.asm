; DESCRIPTION: Renders a purple line between points (189, 170) and (218, 44).
; PLAN: r0=189(x1), r1=170(y1), r2=218(x2), r3=44(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 189
LDI r1, 170
LDI r2, 218
LDI r3, 44
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
