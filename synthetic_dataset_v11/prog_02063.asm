; DESCRIPTION: Renders a yellow line between points (35, 20) and (12, 147).
; PLAN: r0=35(x1), r1=20(y1), r2=12(x2), r3=147(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 35
LDI r1, 20
LDI r2, 12
LDI r3, 147
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
