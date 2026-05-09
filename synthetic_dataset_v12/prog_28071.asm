; DESCRIPTION: Renders a orange line between points (141, 10) and (192, 137).
; PLAN: r0=141(x1), r1=10(y1), r2=192(x2), r3=137(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 141
LDI r1, 10
LDI r2, 192
LDI r3, 137
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
