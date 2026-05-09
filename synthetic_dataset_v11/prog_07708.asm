; DESCRIPTION: Draws a black line from (7, 147) to (30, 181).
; PLAN: r0=7(x1), r1=147(y1), r2=30(x2), r3=181(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 7
LDI r1, 147
LDI r2, 30
LDI r3, 181
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
