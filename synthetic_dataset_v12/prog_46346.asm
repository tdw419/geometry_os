; DESCRIPTION: Renders a yellow line between points (192, 136) and (217, 229).
; PLAN: r0=192(x1), r1=136(y1), r2=217(x2), r3=229(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 192
LDI r1, 136
LDI r2, 217
LDI r3, 229
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
