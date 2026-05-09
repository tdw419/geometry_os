; DESCRIPTION: Draws a blue line from (147, 253) to (137, 45).
; PLAN: r0=147(x1), r1=253(y1), r2=137(x2), r3=45(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 147
LDI r1, 253
LDI r2, 137
LDI r3, 45
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
