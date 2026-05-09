; DESCRIPTION: Places a purple line segment connecting (83, 177) to (478, 117).
; PLAN: r0=83(x1), r1=177(y1), r2=478(x2), r3=117(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 83
LDI r1, 177
LDI r2, 478
LDI r3, 117
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
