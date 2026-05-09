; DESCRIPTION: Draws a yellow line from (379, 147) to (249, 153).
; PLAN: r0=379(x1), r1=147(y1), r2=249(x2), r3=153(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 379
LDI r1, 147
LDI r2, 249
LDI r3, 153
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
