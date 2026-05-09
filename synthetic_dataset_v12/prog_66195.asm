; DESCRIPTION: Draws a blue line from (264, 169) to (433, 185).
; PLAN: r0=264(x1), r1=169(y1), r2=433(x2), r3=185(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 264
LDI r1, 169
LDI r2, 433
LDI r3, 185
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
