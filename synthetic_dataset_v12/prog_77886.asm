; DESCRIPTION: Draws a magenta line from (314, 147) to (384, 17).
; PLAN: r0=314(x1), r1=147(y1), r2=384(x2), r3=17(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 314
LDI r1, 147
LDI r2, 384
LDI r3, 17
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
