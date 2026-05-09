; DESCRIPTION: Draws a green line from (147, 249) to (318, 51).
; PLAN: r0=147(x1), r1=249(y1), r2=318(x2), r3=51(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 147
LDI r1, 249
LDI r2, 318
LDI r3, 51
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
