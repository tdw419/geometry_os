; DESCRIPTION: Draws a purple line from (260, 45) to (245, 169).
; PLAN: r0=260(x1), r1=45(y1), r2=245(x2), r3=169(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 260
LDI r1, 45
LDI r2, 245
LDI r3, 169
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
