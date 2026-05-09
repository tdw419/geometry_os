; DESCRIPTION: Renders a green line between points (89, 160) and (147, 196).
; PLAN: r0=89(x1), r1=160(y1), r2=147(x2), r3=196(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 89
LDI r1, 160
LDI r2, 147
LDI r3, 196
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
