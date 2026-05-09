; DESCRIPTION: Places a purple line segment connecting (233, 234) to (177, 179).
; PLAN: r0=233(x1), r1=234(y1), r2=177(x2), r3=179(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 233
LDI r1, 234
LDI r2, 177
LDI r3, 179
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
