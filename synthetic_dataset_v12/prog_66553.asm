; DESCRIPTION: Renders a green line between points (306, 147) and (137, 173).
; PLAN: r0=306(x1), r1=147(y1), r2=137(x2), r3=173(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 306
LDI r1, 147
LDI r2, 137
LDI r3, 173
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
