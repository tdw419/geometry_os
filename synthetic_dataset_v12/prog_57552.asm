; DESCRIPTION: Places a magenta line segment connecting (190, 148) to (211, 147).
; PLAN: r0=190(x1), r1=148(y1), r2=211(x2), r3=147(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 190
LDI r1, 148
LDI r2, 211
LDI r3, 147
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
