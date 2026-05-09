; DESCRIPTION: Renders a black line between points (147, 167) and (392, 229).
; PLAN: r0=147(x1), r1=167(y1), r2=392(x2), r3=229(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 147
LDI r1, 167
LDI r2, 392
LDI r3, 229
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
