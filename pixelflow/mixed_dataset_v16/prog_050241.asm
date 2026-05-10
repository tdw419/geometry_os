; DESCRIPTION: Draws a yellow line from (147, 192) to (274, 200).
; PLAN: r0=147(x1), r1=192(y1), r2=274(x2), r3=200(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 147
LDI r1, 192
LDI r2, 274
LDI r3, 200
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
