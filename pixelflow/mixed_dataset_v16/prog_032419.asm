; DESCRIPTION: Renders a green line between points (90, 147) and (427, 119).
; PLAN: r0=90(x1), r1=147(y1), r2=427(x2), r3=119(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 90
LDI r1, 147
LDI r2, 427
LDI r3, 119
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
