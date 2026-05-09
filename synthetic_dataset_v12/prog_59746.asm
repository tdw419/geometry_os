; DESCRIPTION: Draws a black line from (147, 177) to (237, 237).
; PLAN: r0=147(x1), r1=177(y1), r2=237(x2), r3=237(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 147
LDI r1, 177
LDI r2, 237
LDI r3, 237
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
