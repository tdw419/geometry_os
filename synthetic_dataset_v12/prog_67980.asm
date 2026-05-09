; DESCRIPTION: Draws a black line from (212, 249) to (275, 147).
; PLAN: r0=212(x1), r1=249(y1), r2=275(x2), r3=147(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 212
LDI r1, 249
LDI r2, 275
LDI r3, 147
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
