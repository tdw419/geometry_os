; DESCRIPTION: Renders a green line between points (177, 57) and (147, 22).
; PLAN: r0=177(x1), r1=57(y1), r2=147(x2), r3=22(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 177
LDI r1, 57
LDI r2, 147
LDI r3, 22
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
