; DESCRIPTION: Places a magenta line segment connecting (249, 80) to (145, 211).
; PLAN: r0=249(x1), r1=80(y1), r2=145(x2), r3=211(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 249
LDI r1, 80
LDI r2, 145
LDI r3, 211
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
