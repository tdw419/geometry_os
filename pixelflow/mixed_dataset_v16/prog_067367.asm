; DESCRIPTION: Places a purple line segment connecting (417, 177) to (357, 236).
; PLAN: r0=417(x1), r1=177(y1), r2=357(x2), r3=236(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 417
LDI r1, 177
LDI r2, 357
LDI r3, 236
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
