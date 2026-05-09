; DESCRIPTION: Places a magenta line segment connecting (364, 217) to (349, 169).
; PLAN: r0=364(x1), r1=217(y1), r2=349(x2), r3=169(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 364
LDI r1, 217
LDI r2, 349
LDI r3, 169
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
