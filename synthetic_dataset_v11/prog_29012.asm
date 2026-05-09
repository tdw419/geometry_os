; DESCRIPTION: Places a purple line segment connecting (34, 206) to (177, 181).
; PLAN: r0=34(x1), r1=206(y1), r2=177(x2), r3=181(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 34
LDI r1, 206
LDI r2, 177
LDI r3, 181
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
