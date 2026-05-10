; DESCRIPTION: Draws a purple line from (187, 169) to (222, 72).
; PLAN: r0=187(x1), r1=169(y1), r2=222(x2), r3=72(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 187
LDI r1, 169
LDI r2, 222
LDI r3, 72
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
