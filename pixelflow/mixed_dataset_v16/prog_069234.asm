; DESCRIPTION: Draws a purple line from (418, 112) to (192, 204).
; PLAN: r0=418(x1), r1=112(y1), r2=192(x2), r3=204(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 418
LDI r1, 112
LDI r2, 192
LDI r3, 204
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
