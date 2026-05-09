; DESCRIPTION: Renders a green line between points (147, 242) and (185, 38).
; PLAN: r0=147(x1), r1=242(y1), r2=185(x2), r3=38(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 147
LDI r1, 242
LDI r2, 185
LDI r3, 38
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
