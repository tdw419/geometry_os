; DESCRIPTION: Renders a yellow line between points (147, 207) and (250, 94).
; PLAN: r0=147(x1), r1=207(y1), r2=250(x2), r3=94(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 147
LDI r1, 207
LDI r2, 250
LDI r3, 94
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
