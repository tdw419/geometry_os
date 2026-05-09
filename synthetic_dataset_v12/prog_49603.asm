; DESCRIPTION: Draws a purple line from (32, 2) to (351, 17).
; PLAN: r0=32(x1), r1=2(y1), r2=351(x2), r3=17(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 32
LDI r1, 2
LDI r2, 351
LDI r3, 17
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
