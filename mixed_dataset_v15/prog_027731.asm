; DESCRIPTION: Draws a purple line from (351, 90) to (204, 103).
; PLAN: r0=351(x1), r1=90(y1), r2=204(x2), r3=103(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 351
LDI r1, 90
LDI r2, 204
LDI r3, 103
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
