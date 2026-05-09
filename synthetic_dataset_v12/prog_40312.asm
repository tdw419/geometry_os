; DESCRIPTION: Draws a purple line from (242, 192) to (351, 223).
; PLAN: r0=242(x1), r1=192(y1), r2=351(x2), r3=223(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 242
LDI r1, 192
LDI r2, 351
LDI r3, 223
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
