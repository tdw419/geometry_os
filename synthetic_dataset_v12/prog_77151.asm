; DESCRIPTION: Places a purple line segment connecting (33, 98) to (357, 124).
; PLAN: r0=33(x1), r1=98(y1), r2=357(x2), r3=124(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 33
LDI r1, 98
LDI r2, 357
LDI r3, 124
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
