; DESCRIPTION: Renders a orange line between points (144, 225) and (147, 55).
; PLAN: r0=144(x1), r1=225(y1), r2=147(x2), r3=55(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 144
LDI r1, 225
LDI r2, 147
LDI r3, 55
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
