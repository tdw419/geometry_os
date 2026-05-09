; DESCRIPTION: Renders a orange line between points (312, 9) and (322, 189).
; PLAN: r0=312(x1), r1=9(y1), r2=322(x2), r3=189(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 312
LDI r1, 9
LDI r2, 322
LDI r3, 189
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
