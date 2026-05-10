; DESCRIPTION: Renders a magenta line between points (374, 147) and (496, 137).
; PLAN: r0=374(x1), r1=147(y1), r2=496(x2), r3=137(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 374
LDI r1, 147
LDI r2, 496
LDI r3, 137
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
