; DESCRIPTION: Draws a yellow line from (101, 147) to (322, 106).
; PLAN: r0=101(x1), r1=147(y1), r2=322(x2), r3=106(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 101
LDI r1, 147
LDI r2, 322
LDI r3, 106
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
