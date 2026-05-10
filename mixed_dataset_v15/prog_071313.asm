; DESCRIPTION: Draws a yellow line from (97, 147) to (279, 129).
; PLAN: r0=97(x1), r1=147(y1), r2=279(x2), r3=129(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 97
LDI r1, 147
LDI r2, 279
LDI r3, 129
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
