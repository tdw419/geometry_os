; DESCRIPTION: Draws a purple line from (83, 147) to (32, 11).
; PLAN: r0=83(x1), r1=147(y1), r2=32(x2), r3=11(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 83
LDI r1, 147
LDI r2, 32
LDI r3, 11
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
