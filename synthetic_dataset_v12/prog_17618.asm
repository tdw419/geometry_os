; DESCRIPTION: Draws a black line from (424, 147) to (353, 1).
; PLAN: r0=424(x1), r1=147(y1), r2=353(x2), r3=1(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 424
LDI r1, 147
LDI r2, 353
LDI r3, 1
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
