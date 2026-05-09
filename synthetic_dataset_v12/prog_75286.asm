; DESCRIPTION: Draws a magenta line from (145, 169) to (315, 234).
; PLAN: r0=145(x1), r1=169(y1), r2=315(x2), r3=234(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 145
LDI r1, 169
LDI r2, 315
LDI r3, 234
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
