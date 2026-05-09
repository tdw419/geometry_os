; DESCRIPTION: Draws a black line from (325, 169) to (203, 170).
; PLAN: r0=325(x1), r1=169(y1), r2=203(x2), r3=170(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 325
LDI r1, 169
LDI r2, 203
LDI r3, 170
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
