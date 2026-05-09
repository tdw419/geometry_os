; DESCRIPTION: Places a magenta line segment connecting (431, 147) to (145, 169).
; PLAN: r0=431(x1), r1=147(y1), r2=145(x2), r3=169(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 431
LDI r1, 147
LDI r2, 145
LDI r3, 169
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
