; DESCRIPTION: Draws a yellow line from (247, 147) to (19, 137).
; PLAN: r0=247(x1), r1=147(y1), r2=19(x2), r3=137(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 247
LDI r1, 147
LDI r2, 19
LDI r3, 137
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
