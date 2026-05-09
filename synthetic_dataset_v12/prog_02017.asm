; DESCRIPTION: Renders a black line between points (56, 92) and (147, 146).
; PLAN: r0=56(x1), r1=92(y1), r2=147(x2), r3=146(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 56
LDI r1, 92
LDI r2, 147
LDI r3, 146
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
