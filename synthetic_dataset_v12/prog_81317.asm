; DESCRIPTION: Draws a black line from (376, 253) to (147, 79).
; PLAN: r0=376(x1), r1=253(y1), r2=147(x2), r3=79(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 376
LDI r1, 253
LDI r2, 147
LDI r3, 79
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
